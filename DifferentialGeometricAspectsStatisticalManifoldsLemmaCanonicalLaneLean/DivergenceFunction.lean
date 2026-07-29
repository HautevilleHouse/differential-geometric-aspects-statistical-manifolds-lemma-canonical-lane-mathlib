import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.StatisticalManifoldStructure

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure DivergenceFunctionPackage {S : StatisticalManifoldPackage} where
  divergence : Type
  fisherMetricRelation : Prop
  geodesicDistance : Prop
  monotonicityUnderMarkovMaps : Prop

structure DivergenceFunctionEvidence {S : StatisticalManifoldPackage}
    (D : DivergenceFunctionPackage S) where
  fisherMetricRelationClosed : D.fisherMetricRelation
  geodesicDistanceClosed : D.geodesicDistance
  monotonicityUnderMarkovMapsClosed : D.monotonicityUnderMarkovMaps

def DivergenceFunctionClosed {S : StatisticalManifoldPackage}
    (D : DivergenceFunctionPackage S) : Prop :=
  D.fisherMetricRelation ∧ D.geodesicDistance ∧ D.monotonicityUnderMarkovMaps

theorem divergence_function_closed_from_evidence
    {S : StatisticalManifoldPackage} (D : DivergenceFunctionPackage S)
    (E : DivergenceFunctionEvidence D) : DivergenceFunctionClosed D := by
  exact And.intro E.fisherMetricRelationClosed
    (And.intro E.geodesicDistanceClosed E.monotonicityUnderMarkovMapsClosed)

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
