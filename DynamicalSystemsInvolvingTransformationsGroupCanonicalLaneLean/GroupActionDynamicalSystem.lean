import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure GroupActionDynamicalSystem (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] where
  action : G → X → X
  continuousAction : ∀ g : G, Continuous (action g)
  identityAction : ∀ x : X, action (1 : G) x = x
  compatibility : ∀ g h : G, ∀ x : X, action g (action h x) = action (g * h) x
  groupTopology : TopologicalSpace G
  continuousGroupAction : Continuous (fun p : G × X => action p.1 p.2)

structure GroupActionDynamicalSystemPackage (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] where
  system : GroupActionDynamicalSystem G X
  invariantMeasures : Prop
  ergodicComponents : Prop
  mixingProperties : Prop
  entropyProperties : Prop

structure GroupActionDynamicalSystemEvidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  (P : GroupActionDynamicalSystemPackage G X) where
  invariantMeasuresClosed : P.invariantMeasures
  ergodicComponentsClosed : P.ergodicComponents
  mixingPropertiesClosed : P.mixingProperties
  entropyPropertiesClosed : P.entropyProperties

def GroupActionDynamicalSystemClosed {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  (P : GroupActionDynamicalSystemPackage G X) : Prop :=
  P.invariantMeasures ∧ P.ergodicComponents ∧ P.mixingProperties ∧ P.entropyProperties

theorem group_action_dynamical_system_closed_from_evidence
  {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  (P : GroupActionDynamicalSystemPackage G X) (E : GroupActionDynamicalSystemEvidence P) :
  GroupActionDynamicalSystemClosed P := by
  exact And.intro E.invariantMeasuresClosed
    (And.intro E.ergodicComponentsClosed
      (And.intro E.mixingPropertiesClosed E.entropyPropertiesClosed))

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse