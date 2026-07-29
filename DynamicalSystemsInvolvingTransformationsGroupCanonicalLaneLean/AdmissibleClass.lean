import DynamicalSystemsInvolvingTransformationsGroupLean.MathlibObjects

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupLean

structure AdmissibleClass where
  object : DynamicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DynamicsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalSystemsInvolvingTransformationsGroupLean
end HautevilleHouse