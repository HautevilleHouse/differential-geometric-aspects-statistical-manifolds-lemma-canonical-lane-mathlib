import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.StatisticalManifoldStructure

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure IndexTheoremPackage {S : StatisticalManifoldPackage} where
  diracOperator : Type
  indexFormula : Prop
  heatKernelAsymptotic : Prop
  chernGaussBonnetResult : Prop
  statisticalIndexContribution : Prop

structure IndexTheoremEvidence {S : StatisticalManifoldPackage}
    (I : IndexTheoremPackage S) where
  indexFormulaClosed : I.indexFormula
  heatKernelAsymptoticClosed : I.heatKernelAsymptotic
  chernGaussBonnetResultClosed : I.chernGaussBonnetResult
  statisticalIndexContributionClosed : I.statisticalIndexContribution

def IndexTheoremClosed {S : StatisticalManifoldPackage}
    (I : IndexTheoremPackage S) : Prop :=
  I.indexFormula ∧ I.heatKernelAsymptotic ∧ I.chernGaussBonnetResult ∧ I.statisticalIndexContribution

theorem index_theorem_closed_from_evidence
    {S : StatisticalManifoldPackage} (I : IndexTheoremPackage S)
    (E : IndexTheoremEvidence I) : IndexTheoremClosed I := by
  exact And.intro E.indexFormulaClosed
    (And.intro E.heatKernelAsymptoticClosed
      (And.intro E.chernGaussBonnetResultClosed E.statisticalIndexContributionClosed))

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
