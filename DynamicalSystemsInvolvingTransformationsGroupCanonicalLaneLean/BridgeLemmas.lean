import DynamicalSystemsInvolvingTransformationsGroupLean.Projection

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DynamicsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicalSystemsInvolvingTransformationsGroupLean
end HautevilleHouse