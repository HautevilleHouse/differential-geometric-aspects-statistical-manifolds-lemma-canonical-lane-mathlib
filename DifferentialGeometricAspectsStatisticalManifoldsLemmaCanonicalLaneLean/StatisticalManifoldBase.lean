import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure StatisticalManifoldPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Prop
  metricTensor : Type v
  fisherInformationMetric : Prop
  connection : Type w
  leviCivitaConnection : Prop
  alphaConnection : Prop
  curvatureTensor : Type x
  ricciTensor : Type y
  scalarCurvature : Type z
  dualConnection : Prop
  conjugateConnection : Prop
  alphaConnectionTorsionFree : Prop
  alphaConnectionMetricCompatible : Prop

structure StatisticalManifoldEvidence (S : StatisticalManifoldPackage) where
  smoothStructureClosed : S.smoothStructure
  fisherInformationMetricClosed : S.fisherInformationMetric
  leviCivitaConnectionClosed : S.leviCivitaConnection
  alphaConnectionClosed : S.alphaConnection
  alphaConnectionTorsionFreeClosed : S.alphaConnectionTorsionFree
  alphaConnectionMetricCompatibleClosed : S.alphaConnectionMetricCompatible
  dualConnectionClosed : S.dualConnection
  conjugateConnectionClosed : S.conjugateConnection

def StatisticalManifoldClosed (S : StatisticalManifoldPackage) : Prop :=
  S.smoothStructure ∧ S.fisherInformationMetric ∧ S.leviCivitaConnection ∧
  S.alphaConnection ∧ S.alphaConnectionTorsionFree ∧ S.alphaConnectionMetricCompatible ∧
  S.dualConnection ∧ S.conjugateConnection

theorem statistical_manifold_closed_from_evidence
    (S : StatisticalManifoldPackage) (E : StatisticalManifoldEvidence S) :
    StatisticalManifoldClosed S := by
  exact And.intro E.smoothStructureClosed
    (And.intro E.fisherInformationMetricClosed
      (And.intro E.leviCivitaConnectionClosed
        (And.intro E.alphaConnectionClosed
          (And.intro E.alphaConnectionTorsionFreeClosed
            (And.intro E.alphaConnectionMetricCompatibleClosed
              (And.intro E.dualConnectionClosed E.conjugateConnectionClosed))))))

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
