import DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : DifferentialGeometricAspectsStatisticalManifoldsLemmaAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DifferentialGeometricAspectsStatisticalManifoldsLemmaWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DifferentialGeometricAspectsStatisticalManifoldsLemmaCanonicalLaneLean
end HautevilleHouse