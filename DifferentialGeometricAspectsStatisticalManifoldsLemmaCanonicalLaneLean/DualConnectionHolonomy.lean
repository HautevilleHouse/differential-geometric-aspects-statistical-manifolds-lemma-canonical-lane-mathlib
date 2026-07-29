import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.StatisticalManifold

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure DualConnectionHolonomyPackage {S : StatisticalManifoldPackage} where
  primalConnection : Prop
  dualConnection : Prop
  holonomyGroup : Prop
  parallelTransport : Prop
  curvatureCompatibility : Prop

structure DualConnectionHolonomyEvidence {S : StatisticalManifoldPackage}
    (D : DualConnectionHolonomyPackage S) where
  primalConnectionClosed : D.primalConnection
  dualConnectionClosed : D.dualConnection
  holonomyGroupClosed : D.holonomyGroup
  parallelTransportClosed : D.parallelTransport
  curvatureCompatibilityClosed : D.curvatureCompatibility

def DualConnectionHolonomyClosed {S : StatisticalManifoldPackage}
    (D : DualConnectionHolonomyPackage S) : Prop :=
  D.primalConnection ∧ D.dualConnection ∧ D.holonomyGroup ∧ D.parallelTransport ∧ D.curvatureCompatibility

theorem dual_connection_holonomy_closed_from_evidence
    {S : StatisticalManifoldPackage} (D : DualConnectionHolonomyPackage S)
    (E : DualConnectionHolonomyEvidence D) : DualConnectionHolonomyClosed D := by
  exact And.intro E.primalConnectionClosed
    (And.intro E.dualConnectionClosed
      (And.intro E.holonomyGroupClosed
        (And.intro E.parallelTransportClosed E.curvatureCompatibilityClosed)))

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
