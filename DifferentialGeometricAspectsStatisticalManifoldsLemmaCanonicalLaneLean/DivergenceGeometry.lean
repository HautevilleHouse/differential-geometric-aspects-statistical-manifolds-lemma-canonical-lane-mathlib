import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.StatisticalCurvatureInvariants

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure DivergenceGeometryPackage {M : StatisticalManifoldPackage}
    {F : FischerInformationMetricPackage M} {A : AmariChentsovConnectionsPackage F}
    (C : StatisticalCurvatureInvariantsPackage A) where
  divergenceFamily : Type u
  bregmanDivergenceDefined : Prop
  fDivergenceDefined : Prop
  alphaDivergenceDefined : Prop
  metricFromDivergence : Prop
  connectionFromDivergence : Prop
  curvatureFromDivergence : Prop
  metricFromDivergenceTerm : metricFromDivergence
  connectionFromDivergenceTerm : connectionFromDivergence
  curvatureFromDivergenceTerm : curvatureFromDivergence

structure DivergenceGeometryEvidence {M : StatisticalManifoldPackage}
    {F : FischerInformationMetricPackage M} {A : AmariChentsovConnectionsPackage F}
    {C : StatisticalCurvatureInvariantsPackage A}
    (D : DivergenceGeometryPackage C) where
  metricFromDivergenceClosed : D.metricFromDivergence
  connectionFromDivergenceClosed : D.connectionFromDivergence
  curvatureFromDivergenceClosed : D.curvatureFromDivergence

def DivergenceGeometryClosed {M : StatisticalManifoldPackage}
    {F : FischerInformationMetricPackage M} {A : AmariChentsovConnectionsPackage F}
    {C : StatisticalCurvatureInvariantsPackage A}
    (D : DivergenceGeometryPackage C) : Prop :=
  D.metricFromDivergence ∧ D.connectionFromDivergence ∧ D.curvatureFromDivergence

theorem divergence_geometry_closed_from_evidence
    {M : StatisticalManifoldPackage} {F : FischerInformationMetricPackage M}
    {A : AmariChentsovConnectionsPackage F} {C : StatisticalCurvatureInvariantsPackage A}
    (D : DivergenceGeometryPackage C) (E : DivergenceGeometryEvidence D) :
    DivergenceGeometryClosed D := by
  exact And.intro E.metricFromDivergenceClosed
    (And.intro E.connectionFromDivergenceClosed E.curvatureFromDivergenceClosed)

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse
