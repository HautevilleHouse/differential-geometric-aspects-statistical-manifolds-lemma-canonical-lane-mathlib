import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.AlphaGeometry

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure CurvatureInvariantsPackage
    {S : StatisticalManifoldPackage} {F : FisherInformationMetricPackage S}
    {G : AlphaGeometryPackage S F} where
  ricciCurvature : Prop
  scalarCurvature : Prop
  sectionalCurvature : Prop
  constantCurvatureCondition : Prop

structure CurvatureInvariantsEvidence
    {S : StatisticalManifoldPackage} {F : FisherInformationMetricPackage S}
    {G : AlphaGeometryPackage S F} (C : CurvatureInvariantsPackage S F G) where
  ricciCurvatureClosed : C.ricciCurvature
  scalarCurvatureClosed : C.scalarCurvature
  sectionalCurvatureClosed : C.sectionalCurvature
  constantCurvatureConditionClosed : C.constantCurvatureCondition

def CurvatureInvariantsClosed
    {S : StatisticalManifoldPackage} {F : FisherInformationMetricPackage S}
    {G : AlphaGeometryPackage S F} (C : CurvatureInvariantsPackage S F G) : Prop :=
  C.ricciCurvature ∧ C.scalarCurvature ∧ C.sectionalCurvature ∧ C.constantCurvatureCondition

theorem curvature_invariants_closed_from_evidence
    {S : StatisticalManifoldPackage} {F : FisherInformationMetricPackage S}
    {G : AlphaGeometryPackage S F} (C : CurvatureInvariantsPackage S F G)
    (E : CurvatureInvariantsEvidence C) : CurvatureInvariantsClosed C := by
  exact And.intro E.ricciCurvatureClosed
    (And.intro E.scalarCurvatureClosed
      (And.intro E.sectionalCurvatureClosed E.constantCurvatureConditionClosed))

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
