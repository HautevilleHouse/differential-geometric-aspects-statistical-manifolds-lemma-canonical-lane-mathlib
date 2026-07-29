import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.FisherInformationMetric

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure AmariChentsovConnectionsPackage {M : StatisticalManifoldPackage}
    (F : FischerInformationMetricPackage M) where
  alphaFamily : ℝ → (α : ℝ) → Prop
  dualConnection : (α : ℝ) → Prop
  alphaTorsionFree : (α : ℝ) → Prop
  alphaMetricCompat : (α : ℝ) → Prop
  alphaTwoIsLeviCivita : Prop
  alphaTwoIsLeviCivitaTerm : alphaTwoIsLeviCivita
  familyDefined : Prop
  familyDefinedTerm : familyDefined

structure AmariChentsovConnectionsEvidence {M : StatisticalManifoldPackage}
    {F : FischerInformationMetricPackage M}
    (A : AmariChentsovConnectionsPackage F) where
  alphaTwoIsLeviCivitaClosed : A.alphaTwoIsLeviCivita
  familyDefinedClosed : A.familyDefined

def AmariChentsovConnectionsClosed {M : StatisticalManifoldPackage}
    {F : FischerInformationMetricPackage M}
    (A : AmariChentsovConnectionsPackage F) : Prop :=
  A.alphaTwoIsLeviCivita ∧ A.familyDefined

theorem amari_chentsov_connections_closed_from_evidence
    {M : StatisticalManifoldPackage} {F : FischerInformationMetricPackage M}
    (A : AmariChentsovConnectionsPackage F)
    (E : AmariChentsovConnectionsEvidence A) : AmariChentsovConnectionsClosed A := by
  exact And.intro E.alphaTwoIsLeviCivitaClosed E.familyDefinedClosed

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
