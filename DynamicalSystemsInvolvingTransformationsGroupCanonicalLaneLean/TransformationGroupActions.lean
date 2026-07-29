import DynamicalSystemsInvolvingTransformationsGroupLean.MathlibObjects

/-!
# Transformation Group Actions Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupLean

structure TransformationGroupActionsPackage where
  group : Type u
  groupOperation : group → group → group
  groupUnit : group
  groupInverse : group → group
  actionSet : Type v
  actionMap : group → actionSet → actionSet
  continuityAction : Prop
  groupTopology : Prop
  actionContinuity : Prop

structure TransformationGroupActionsEvidence (G : TransformationGroupActionsPackage) where
  continuityActionClosed : G.continuityAction
  groupTopologyClosed : G.groupTopology
  actionContinuityClosed : G.actionContinuity

def TransformationGroupActionsClosed (G : TransformationGroupActionsPackage) : Prop :=
  G.continuityAction ∧ G.groupTopology ∧ G.actionContinuity

theorem transformation_group_actions_closed_from_evidence
    (G : TransformationGroupActionsPackage) (E : TransformationGroupActionsEvidence G) :
    TransformationGroupActionsClosed G := by
  exact And.intro E.continuityActionClosed
    (And.intro E.groupTopologyClosed E.actionContinuityClosed)

end DynamicalSystemsInvolvingTransformationsGroupLean
end HautevilleHouse