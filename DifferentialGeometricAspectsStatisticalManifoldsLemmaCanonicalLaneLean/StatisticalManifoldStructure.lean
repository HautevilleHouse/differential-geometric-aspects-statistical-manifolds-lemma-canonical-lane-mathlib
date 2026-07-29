import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure StatisticalManifoldPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  fisherMetric : Type v
  connection : Type w
  curvatureTensor : Type x
  statisticalStructureSmooth : Prop
  fisherMetricPositiveDefinite : Prop
  connectionTorsionFree : Prop
  curatureCompatibility : Prop

structure StatisticalManifoldEvidence (S : StatisticalManifoldPackage) where
  statisticalStructureSmoothClosed : S.statisticalStructureSmooth
  fisherMetricPositiveDefiniteClosed : S.fisherMetricPositiveDefinite
  connectionTorsionFreeClosed : S.connectionTorsionFree
  curatureCompatibilityClosed : S.curatureCompatibility

def StatisticalManifoldClosed (S : StatisticalManifoldPackage) : Prop :=
  S.statisticalStructureSmooth ∧ S.fisherMetricPositiveDefinite ∧
  S.connectionTorsionFree ∧ S.curatureCompatibility

theorem statistical_manifold_closed_from_evidence
    (S : StatisticalManifoldPackage) (E : StatisticalManifoldEvidence S) :
    StatisticalManifoldClosed S := by
  exact And.intro E.statisticalStructureSmoothClosed
    (And.intro E.fisherMetricPositiveDefiniteClosed
      (And.intro E.connectionTorsionFreeClosed E.curatureCompatibilityClosed))

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
