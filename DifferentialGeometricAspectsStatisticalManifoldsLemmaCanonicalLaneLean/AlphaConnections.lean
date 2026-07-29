import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.StatisticalManifoldConnection

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure AlphaConnection {M : Type} [TopologicalSpace M] [SmoothManifold M] (S : StatisticalManifold M) (α : ℝ) where
  connection : Connection M
  torsionFree : IsTorsionFree connection
  metricCompatible : ∀ X Y Z : VectorField M, X (S.metric Y Z) = S.fisherMetric (connection X Y) Z + S.fisherMetric Y (connection X Z) + α * S.fisherMetric X (S.fisherMetric ♯ (S.riemannCurvature) Y Z)

def AlphaConnectionFamily {M : Type} [TopologicalSpace M] [SmoothManifold M] (S : StatisticalManifold M) : Set (ℝ × Connection M) :=
  { (α, ∇) | ∃ (ac : AlphaConnection S α), ac.connection = ∇ }

theorem levi_civita_is_alpha_0 {M : Type} [TopologicalSpace M] [SmoothManifold M] (S : StatisticalManifold M) : AlphaConnection S 0 := by
  refine {
    connection := S.leviCivitaConnection
    torsionFree := S.leviCivitaIsTorsionFree
    metricCompatible := ?_
  }
  intro X Y Z
  calc
    X (S.metric Y Z) = S.fisherMetric (S.leviCivitaConnection X Y) Z + S.fisherMetric Y (S.leviCivitaConnection X Z) :=
      S.leviCivitaMetricCompatible X Y Z
    _ = S.fisherMetric (S.leviCivitaConnection X Y) Z + S.fisherMetric Y (S.leviCivitaConnection X Z) + 0 * S.fisherMetric X (S.fisherMetric ♯ (S.riemannCurvature) Y Z) :=
      by ring

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse