import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.AmariChentsovConnections

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure StatisticalCurvatureInvariantsPackage {M : StatisticalManifoldPackage}
    {F : FischerInformationMetricPackage M}
    (A : AmariChentsovConnectionsPackage F) where
  riemannTensor : Type u
  ricciTensor : Type v
  scalarCurvature : Type w
  sectionalCurvature : Type x
  statisticalSymmetry : Prop
  ricciFromRiemann : Prop
  scalarFromRicci : Prop
  statisticalSymmetryTerm : statisticalSymmetry
  ricciFromRiemannTerm : ricciFromRiemann
  scalarFromRicciTerm : scalarFromRicci

structure StatisticalCurvatureInvariantsEvidence {M : StatisticalManifoldPackage}
    {F : FischerInformationMetricPackage M} {A : AmariChentsovConnectionsPackage F}
    (C : StatisticalCurvatureInvariantsPackage A) where
  statisticalSymmetryClosed : C.statisticalSymmetry
  ricciFromRiemannClosed : C.ricciFromRiemann
  scalarFromRicciClosed : C.scalarFromRicci

def StatisticalCurvatureInvariantsClosed {M : StatisticalManifoldPackage}
    {F : FischerInformationMetricPackage M} {A : AmariChentsovConnectionsPackage F}
    (C : StatisticalCurvatureInvariantsPackage A) : Prop :=
  C.statisticalSymmetry ∧ C.ricciFromRiemann ∧ C.scalarFromRicci

theorem statistical_curvature_invariants_closed_from_evidence
    {M : StatisticalManifoldPackage} {F : FischerInformationMetricPackage M}
    {A : AmariChentsovConnectionsPackage F} (C : StatisticalCurvatureInvariantsPackage A)
    (E : StatisticalCurvatureInvariantsEvidence C) : StatisticalCurvatureInvariantsClosed C := by
  exact And.intro E.statisticalSymmetryClosed
    (And.intro E.ricciFromRiemannClosed E.scalarFromRicciClosed)

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
