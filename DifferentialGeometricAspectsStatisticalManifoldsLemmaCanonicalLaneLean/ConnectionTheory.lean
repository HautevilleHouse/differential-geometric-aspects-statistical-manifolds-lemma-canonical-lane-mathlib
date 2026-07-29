import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure ConnectionTheoryPackage {S : StatisticalManifoldPackage}
    (C : CurvatureInvariantsPackage S) where
  leviCivitaConnection : Type u
  alphaConnection : Type v
  dualConnection : Type w
  torsion : Prop
  curvature : Prop
  parallelTransport : Prop
  torsionFree : Prop
  curvatureCompatibility : Prop
  parallelTransportDefined : Prop

structure ConnectionTheoryEvidence {S : StatisticalManifoldPackage}
    {C : CurvatureInvariantsPackage S} (CT : ConnectionTheoryPackage C) where
  torsionFreeClosed : CT.torsionFree
  curvatureCompatibilityClosed : CT.curvatureCompatibility
  parallelTransportDefinedClosed : CT.parallelTransportDefined

def ConnectionTheoryClosed {S : StatisticalManifoldPackage}
    {C : CurvatureInvariantsPackage S} (CT : ConnectionTheoryPackage C) : Prop :=
  CT.torsionFree ∧ CT.curvatureCompatibility ∧ CT.parallelTransportDefined

theorem connection_theory_closed_from_evidence
    {S : StatisticalManifoldPackage} {C : CurvatureInvariantsPackage S}
    (CT : ConnectionTheoryPackage C) (E : ConnectionTheoryEvidence CT) :
    ConnectionTheoryClosed CT := by
  exact And.intro E.torsionFreeClosed
    (And.intro E.curvatureCompatibilityClosed E.parallelTransportDefinedClosed)

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse