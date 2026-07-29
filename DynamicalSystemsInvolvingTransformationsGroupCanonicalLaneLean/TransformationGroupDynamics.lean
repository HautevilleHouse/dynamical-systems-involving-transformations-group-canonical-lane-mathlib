import canonicalLaneMathlib.AdmissibleClass

/-!
# Transformation Group Dynamical Systems Package

This module records the core objects for dynamical systems involving a group of
transformations acting on a phase space.  The package includes the action,
invariant sets, orbit structure, and recurrence properties needed to frame
the admissible-class bridge.
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure TransformationGroup where
  carrier : Type u
  groupOp : carrier → carrier → carrier
  groupInv : carrier → carrier
  groupId : carrier
  mulAssoc : ∀ a b c : carrier, groupOp (groupOp a b) c = groupOp a (groupOp b c)
  invLeft : ∀ a : carrier, groupOp (groupInv a) a = groupId
  idLeft : ∀ a : carrier, groupOp groupId a = a

structure PhaseSpace where
  carrier : Type v
  topology : TopologicalSpace carrier

structure GroupAction (G : TransformationGroup) (X : PhaseSpace) where
  act : G.carrier → X.carrier → X.carrier
  actId : ∀ x : X.carrier, act G.groupId x = x
  actMul : ∀ g h : G.carrier, ∀ x : X.carrier, act (G.groupOp g h) x = act g (act h x)
  actContinuous : ∀ g : G.carrier, Continuous (act g)

structure InvariantSet {G : TransformationGroup} {X : PhaseSpace} (ρ : GroupAction G X) where
  subset : Set X.carrier
  invariant : ∀ g : G.carrier, ρ.act g '' subset = subset

structure Orbit {G : TransformationGroup} {X : PhaseSpace} (ρ : GroupAction G X) (x : X.carrier) where
  points : Set X.carrier := { y : X.carrier | ∃ g : G.carrier, ρ.act g x = y }

structure TransformationGroupDynamicsPackage where
  G : TransformationGroup
  X : PhaseSpace
  action : GroupAction G X
  closedInvariantSets : Prop
  orbitClosureRelation : Prop
  recurrenceProperty : Prop
  compactInvariantSubset : Prop

structure TransformationGroupDynamicsEvidence (P : TransformationGroupDynamicsPackage) where
  closedInvariantSetsClosed : P.closedInvariantSets
  orbitClosureRelationClosed : P.orbitClosureRelation
  recurrencePropertyClosed : P.recurrenceProperty
  compactInvariantSubsetClosed : P.compactInvariantSubset

def TransformationGroupDynamicsClosed (P : TransformationGroupDynamicsPackage) : Prop :=
  P.closedInvariantSets ∧ P.orbitClosureRelation ∧
  P.recurrenceProperty ∧ P.compactInvariantSubset

theorem transformation_group_dynamics_closed_from_evidence
    (P : TransformationGroupDynamicsPackage) (E : TransformationGroupDynamicsEvidence P) :
    TransformationGroupDynamicsClosed P := by
  exact And.intro E.closedInvariantSetsClosed
    (And.intro E.orbitClosureRelationClosed
      (And.intro E.recurrencePropertyClosed E.compactInvariantSubsetClosed))

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse