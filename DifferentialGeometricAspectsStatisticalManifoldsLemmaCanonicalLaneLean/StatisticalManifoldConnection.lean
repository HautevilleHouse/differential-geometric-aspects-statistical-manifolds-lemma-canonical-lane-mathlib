import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure StatisticalManifold (M : Type) [TopologicalSpace M] [SmoothManifold M] where
  metric : RiemannianMetric M
  fisherMetric : RiemannianMetric M
  dualConnection : Connection M
  leviCivitaConnection : Connection M
  metricMatching : metric = fisherMetric
  dualTorsionFree : IsTorsionFree dualConnection

structure StatisticalManifoldPackage where
  manifoldType : Type
  topology : TopologicalSpace manifoldType
  smoothManifold : SmoothManifold manifoldType
  statisticalStructure : StatisticalManifold manifoldType

def StatisticalManifoldClosed (S : StatisticalManifoldPackage) : Prop :=
  S.statisticalStructure.metricMatching ∧ S.statisticalStructure.dualTorsionFree

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse