import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.StatisticalManifoldStructure

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure AmariChentsovGeometryPackage {S : StatisticalManifoldPackage} where
  alphaConnection : S.connection -> Type
  dualConnection : S.connection -> Type
  alphaTorsionFree : Prop
  dualityHolds : Prop
  chentsovAmariTheorem : Prop

structure AmariChentsovGeometryEvidence {S : StatisticalManifoldPackage}
    (A : AmariChentsovGeometryPackage S) where
  alphaTorsionFreeClosed : A.alphaTorsionFree
  dualityHoldsClosed : A.dualityHolds
  chentsovAmariTheoremClosed : A.chentsovAmariTheorem

def AmariChentsovGeometryClosed {S : StatisticalManifoldPackage}
    (A : AmariChentsovGeometryPackage S) : Prop :=
  A.alphaTorsionFree ∧ A.dualityHolds ∧ A.chentsovAmariTheorem

theorem amari_chentsov_geometry_closed_from_evidence
    {S : StatisticalManifoldPackage} (A : AmariChentsovGeometryPackage S)
    (E : AmariChentsovGeometryEvidence A) : AmariChentsovGeometryClosed A := by
  exact And.intro E.alphaTorsionFreeClosed
    (And.intro E.dualityHoldsClosed E.chentsovAmariTheoremClosed)

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
