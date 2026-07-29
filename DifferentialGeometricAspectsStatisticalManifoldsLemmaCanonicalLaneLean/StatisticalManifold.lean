import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure StatisticalManifoldPackage where
  carrier : Type u
  topology : TopologicalSpace carrier
  metric : Type v
  riemannianStructure : Prop
  statisticalConnection : Prop
  dualAffineConnection : Prop
  potentialFunction : Prop

structure StatisticalManifoldEvidence (S : StatisticalManifoldPackage) where
  riemannianStructureClosed : S.riemannianStructure
  statisticalConnectionClosed : S.statisticalConnection
  dualAffineConnectionClosed : S.dualAffineConnection
  potentialFunctionClosed : S.potentialFunction

def StatisticalManifoldClosed (S : StatisticalManifoldPackage) : Prop :=
  S.riemannianStructure ∧ S.statisticalConnection ∧ S.dualAffineConnection ∧ S.potentialFunction

theorem statistical_manifold_closed_from_evidence (S : StatisticalManifoldPackage)
    (E : StatisticalManifoldEvidence S) : StatisticalManifoldClosed S := by
  exact And.intro E.riemannianStructureClosed
    (And.intro E.statisticalConnectionClosed
      (And.intro E.dualAffineConnectionClosed E.potentialFunctionClosed))

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
