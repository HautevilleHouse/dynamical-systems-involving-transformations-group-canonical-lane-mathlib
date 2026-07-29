import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroup

structure TransformationGroupAction (M : Type u) [TopologicalSpace M] where
  group : Type v
  groupMul : group → group → group
  groupInv : group → group
  groupIdentity : group
  action : group → M → M
  continuousAction : Prop
  identityActingAsIdentity : ∀ x : M, action groupIdentity x = x
  compatibility : ∀ (g h : group) (x : M), action (groupMul g h) x = action g (action h x)

structure TransformationGroupActionEvidence (T : TransformationGroupAction M) where
  continuousActionClosed : T.continuousAction
  identityActingAsIdentityClosed : T.identityActingAsIdentity
  compatibilityClosed : T.compatibility

def TransformationGroupActionClosed (T : TransformationGroupAction M) : Prop :=
  T.continuousAction ∧ T.identityActingAsIdentity ∧ T.compatibility

theorem transformation_group_action_closed_from_evidence
    (T : TransformationGroupAction M) (E : TransformationGroupActionEvidence T) :
    TransformationGroupActionClosed T := by
  exact And.intro E.continuousActionClosed
    (And.intro E.identityActingAsIdentityClosed E.compatibilityClosed)

end DynamicalSystemsInvolvingTransformationsGroup
end HautevilleHouse
