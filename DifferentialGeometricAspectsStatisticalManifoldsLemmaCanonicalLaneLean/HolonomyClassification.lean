import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.StatisticalManifoldStructure

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure HolonomyClassificationPackage {S : StatisticalManifoldPackage} where
  holonomyGroup : Type
  reducedHolonomy : Type
  ambroseSingerTheorem : Prop
  holonomyInvariantSubspace : Prop
  statisticalHolonomyDecomposition : Prop

structure HolonomyClassificationEvidence {S : StatisticalManifoldPackage}
    (H : HolonomyClassificationPackage S) where
  ambroseSingerTheoremClosed : H.ambroseSingerTheorem
  holonomyInvariantSubspaceClosed : H.holonomyInvariantSubspace
  statisticalHolonomyDecompositionClosed : H.statisticalHolonomyDecomposition

def HolonomyClassificationClosed {S : StatisticalManifoldPackage}
    (H : HolonomyClassificationPackage S) : Prop :=
  H.ambroseSingerTheorem ∧ H.holonomyInvariantSubspace ∧ H.statisticalHolonomyDecomposition

theorem holonomy_classification_closed_from_evidence
    {S : StatisticalManifoldPackage} (H : HolonomyClassificationPackage S)
    (E : HolonomyClassificationEvidence H) : HolonomyClassificationClosed H := by
  exact And.intro E.ambroseSingerTheoremClosed
    (And.intro E.holonomyInvariantSubspaceClosed E.statisticalHolonomyDecompositionClosed)

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
