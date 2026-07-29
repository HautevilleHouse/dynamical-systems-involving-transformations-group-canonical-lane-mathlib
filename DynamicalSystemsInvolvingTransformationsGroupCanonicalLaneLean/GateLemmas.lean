import DynamicalSystemsInvolvingTransformationsGroupLean.BridgeLemmas

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DynamicalSystemsInvolvingTransformationsGroupLean
end HautevilleHouse