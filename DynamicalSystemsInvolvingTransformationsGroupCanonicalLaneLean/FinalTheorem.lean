import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean.TransformationGroupDynamics
import HautevilleHouse.DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean.ErgodicTheoryAdmissible

/-!
# Final Theorem Closure for Dynamical Systems Involving Transformations Group

This module defines the constrained theorem closure for this domain and provides
the epistemological closure via bridge and gate from the admissible class.
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

def ConstrainedDynamicalSystemsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamical_systems_endgame (A : AdmissibleClass) :
    ConstrainedDynamicalSystemsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse