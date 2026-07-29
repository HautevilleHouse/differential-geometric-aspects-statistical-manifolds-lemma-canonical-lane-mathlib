import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure CurvatureInvariantPackage where
  riemannCurvatureTensor : Type u
  ricciCurvatureTensor : Type v
  scalarCurvature : Type w
  sectionalCurvature : Prop
  holomorphicSectionalCurvature : Prop
  ricciScalarRelation : Prop
  bisectionalCurvature : Prop
  curvatureSymmetries : Prop
  firstBianchiIdentity : Prop
  secondBianchiIdentity : Prop

structure CurvatureInvariantEvidence (C : CurvatureInvariantPackage) where
  curvatureSymmetriesClosed : C.curvatureSymmetries
  firstBianchiIdentityClosed : C.firstBianchiIdentity
  secondBianchiIdentityClosed : C.secondBianchiIdentity
  ricciScalarRelationClosed : C.ricciScalarRelation
  sectionalCurvatureClosed : C.sectionalCurvature
  holomorphicSectionalCurvatureClosed : C.holomorphicSectionalCurvature
  bisectionalCurvatureClosed : C.bisectionalCurvature

def CurvatureInvariantClosed (C : CurvatureInvariantPackage) : Prop :=
  C.riemannCurvatureTensor ∧ C.ricciCurvatureTensor ∧ C.scalarCurvature ∧
  C.sectionalCurvature ∧ C.holomorphicSectionalCurvature ∧ C.ricciScalarRelation ∧
  C.bisectionalCurvature ∧ C.curvatureSymmetries ∧ C.firstBianchiIdentity ∧ C.secondBianchiIdentity

theorem curvature_invariant_closed_from_evidence
    (C : CurvatureInvariantPackage) (E : CurvatureInvariantEvidence C) :
    CurvatureInvariantClosed C :=
by
  unfold CurvatureInvariantClosed
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact E.curvatureSymmetriesClosed
  · exact E.firstBianchiIdentityClosed
  · exact E.secondBianchiIdentityClosed
  · exact E.ricciScalarRelationClosed
  · exact E.sectionalCurvatureClosed
  · exact E.holomorphicSectionalCurvatureClosed
  · exact E.bisectionalCurvatureClosed
  · exact C.riemannCurvatureTensor
  · exact C.ricciCurvatureTensor
  · exact C.scalarCurvature

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse