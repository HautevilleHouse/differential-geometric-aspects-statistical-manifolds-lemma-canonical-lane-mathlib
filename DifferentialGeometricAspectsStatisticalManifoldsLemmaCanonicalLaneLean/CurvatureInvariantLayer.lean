import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.StatisticalManifoldStructure

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure CurvatureInvariantPackage {S : StatisticalManifoldPackage} (C : S.connection) where
  riemannCurvature : Type
  ricciCurvature : Type
  scalarCurvature : Type
  sectionalCurvature : Type
  riemannSymmetries : Prop
  ricciContraction : Prop
  scalarTrace : Prop
  sectionalFormula : Prop

structure CurvatureInvariantEvidence {S : StatisticalManifoldPackage} {C : S.connection}
    (P : CurvatureInvariantPackage C) where
  riemannSymmetriesClosed : P.riemannSymmetries
  ricciContractionClosed : P.ricciContraction
  scalarTraceClosed : P.scalarTrace
  sectionalFormulaClosed : P.sectionalFormula

def CurvatureInvariantClosed {S : StatisticalManifoldPackage} {C : S.connection}
    (P : CurvatureInvariantPackage C) : Prop :=
  P.riemannSymmetries ∧ P.ricciContraction ∧ P.scalarTrace ∧ P.sectionalFormula

theorem curvature_invariant_closed_from_evidence
    {S : StatisticalManifoldPackage} {C : S.connection}
    (P : CurvatureInvariantPackage C) (E : CurvatureInvariantEvidence P) :
    CurvatureInvariantClosed P := by
  exact And.intro E.riemannSymmetriesClosed
    (And.intro E.ricciContractionClosed
      (And.intro E.scalarTraceClosed E.sectionalFormulaClosed))

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
