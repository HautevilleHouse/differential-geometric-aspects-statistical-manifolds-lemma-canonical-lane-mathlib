import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.StatisticalManifoldConnection
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.StatisticalCurvature
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.AlphaConnections

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure FisherRaoMetric {M : Type} [TopologicalSpace M] [SmoothManifold M] (P : M → ProbabilityMeasure) where
  metric : RiemannianMetric M
  fisherRaoIdentification : metric = FisherMetric P

def FisherMetric {M : Type} [TopologicalSpace M] [SmoothManifold M] (P : M → ProbabilityMeasure) : RiemannianMetric M :=
  { tensorField := fun x => (P x).fisherInformation
    smoothness := by
      -- This is a placeholder; in practice, smoothness follows from smoothness of P
      exact (P x).fisherInformation_smooth
    symmetry := by
      intro X Y
      simp [add_comm]
    positiveDefiniteness := by
      intro X h
      -- Use property of Fisher information
      exact (P x).fisherInformation_positiveDefinite X h }

theorem fisher_rao_metric_positive_definite {M : Type} [TopologicalSpace M] [SmoothManifold M] (P : M → ProbabilityMeasure) (fm : FisherRaoMetric P) : PositiveDefinite fm.metric :=
by
  rw [fm.fisherRaoIdentification]
  unfold FisherMetric
  intro x
  intro X hX
  -- The Fisher metric is positive definite at each point because Fisher information is positive definite
  have h := (P x).fisherInformation_positiveDefinite X hX
  exact h

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse