import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.FisherInformationMetric

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure AlphaGeometryPackage
    {S : StatisticalManifoldPackage} {F : FisherInformationMetricPackage S} where
  alpha : ℝ
  alphaConnection : Prop
  alphaCurvature : Prop
  alphaDivergence : Prop
  chiSquareMetric : Prop

structure AlphaGeometryEvidence
    {S : StatisticalManifoldPackage} {F : FisherInformationMetricPackage S}
    (G : AlphaGeometryPackage S F) where
  alphaConnectionClosed : G.alphaConnection
  alphaCurvatureClosed : G.alphaCurvature
  alphaDivergenceClosed : G.alphaDivergence
  chiSquareMetricClosed : G.chiSquareMetric

def AlphaGeometryClosed
    {S : StatisticalManifoldPackage} {F : FisherInformationMetricPackage S}
    (G : AlphaGeometryPackage S F) : Prop :=
  G.alphaConnection ∧ G.alphaCurvature ∧ G.alphaDivergence ∧ G.chiSquareMetric

theorem alpha_geometry_closed_from_evidence
    {S : StatisticalManifoldPackage} {F : FisherInformationMetricPackage S}
    (G : AlphaGeometryPackage S F) (E : AlphaGeometryEvidence G) : AlphaGeometryClosed G := by
  exact And.intro E.alphaConnectionClosed
    (And.intro E.alphaCurvatureClosed
      (And.intro E.alphaDivergenceClosed E.chiSquareMetricClosed))

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
