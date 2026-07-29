import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.StatisticalManifoldBase

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure FischerInformationMetricPackage (M : StatisticalManifoldPackage) where
  densityFamily : Type u
  scoreFunction : Type v
  fisherMetricDefined : Prop
  positiveDefinite : Prop
  smoothInParameters : Prop
  fisherMetricDefinedTerm : fisherMetricDefined
  positiveDefiniteTerm : positiveDefinite
  smoothInParametersTerm : smoothInParameters

structure FischerInformationMetricEvidence {M : StatisticalManifoldPackage}
    (F : FischerInformationMetricPackage M) where
  fisherMetricDefinedClosed : F.fisherMetricDefined
  positiveDefiniteClosed : F.positiveDefinite
  smoothInParametersClosed : F.smoothInParameters

def FischerInformationMetricClosed {M : StatisticalManifoldPackage}
    (F : FischerInformationMetricPackage M) : Prop :=
  F.fisherMetricDefined ∧ F.positiveDefinite ∧ F.smoothInParameters

theorem fischer_information_metric_closed_from_evidence
    {M : StatisticalManifoldPackage} (F : FischerInformationMetricPackage M)
    (E : FischerInformationMetricEvidence F) : FischerInformationMetricClosed F := by
  exact And.intro E.fisherMetricDefinedClosed
    (And.intro E.positiveDefiniteClosed E.smoothInParametersClosed)

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
