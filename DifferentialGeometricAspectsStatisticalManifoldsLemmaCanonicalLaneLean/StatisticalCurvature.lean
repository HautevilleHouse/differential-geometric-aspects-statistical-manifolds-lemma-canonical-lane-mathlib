import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.StatisticalManifoldConnection

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure CurvatureInvariants {M : Type} [TopologicalSpace M] [SmoothManifold M] (S : StatisticalManifold M) where
  riemannCurvature : Tensor M 3 1
  ricciCurvature : Tensor M 2 0
  scalarCurvature : M → ℝ
  sectionalCurvature : TangentBundle M → TangentBundle M → ℝ

def CurvatureInvariantClosed {M : Type} [TopologicalSpace M] [SmoothManifold M] {S : StatisticalManifold M} (C : CurvatureInvariants S) : Prop :=
  True

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse