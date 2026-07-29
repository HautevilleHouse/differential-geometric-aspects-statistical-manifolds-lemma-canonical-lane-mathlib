import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure HolonomyTheoryPackage {S : StatisticalManifoldPackage}
    {C : CurvatureInvariantsPackage S} {CT : ConnectionTheoryPackage C} where
  holonomyGroup : Type u
  holonomyAlgebra : Type v
  holonomyInvariant : Prop
  holonomyReduction : Prop
  curvatureHolonomyRelation : Prop
  holonomyGroupDefined : holonomyGroup
  holonomyAlgebraDefined : holonomyAlgebra
  holonomyInvariantClosed : holonomyInvariant
  holonomyReductionClosed : holonomyReduction
  curvatureHolonomyRelationClosed : curvatureHolonomyRelation

structure HolonomyTheoryEvidence {S : StatisticalManifoldPackage}
    {C : CurvatureInvariantsPackage S} {CT : ConnectionTheoryPackage C}
    (H : HolonomyTheoryPackage CT) where
  holonomyInvariantClosed : H.holonomyInvariant
  holonomyReductionClosed : H.holonomyReduction
  curvatureHolonomyRelationClosed : H.curvatureHolonomyRelation

def HolonomyTheoryClosed {S : StatisticalManifoldPackage}
    {C : CurvatureInvariantsPackage S} {CT : ConnectionTheoryPackage C}
    (H : HolonomyTheoryPackage CT) : Prop :=
  H.holonomyInvariant ∧ H.holonomyReduction ∧ H.curvatureHolonomyRelation

theorem holonomy_theory_closed_from_evidence
    {S : StatisticalManifoldPackage} {C : CurvatureInvariantsPackage S}
    {CT : ConnectionTheoryPackage C} (H : HolonomyTheoryPackage CT)
    (E : HolonomyTheoryEvidence H) : HolonomyTheoryClosed H := by
  exact And.intro E.holonomyInvariantClosed
    (And.intro E.holonomyReductionClosed E.curvatureHolonomyRelationClosed)

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse