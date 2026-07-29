import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure GroupActionStructure (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] where
  action : G → X → X
  continuous : ∀ g : G, Continuous (action g)
  identityAction : ∀ x : X, action (1 : G) x = x
  compatibility : ∀ g h : G, ∀ x : X, action (g * h) x = action g (action h x)

structure GroupActionEvidence (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
  (A : GroupActionStructure G X) where
  continuousClosed : A.continuous
  identityActionClosed : A.identityAction
  compatibilityClosed : A.compatibility

def GroupActionClosed (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
  (A : GroupActionStructure G X) : Prop :=
  A.continuous ∧ A.identityAction ∧ A.compatibility

theorem group_action_closed_from_evidence (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
  (A : GroupActionStructure G X) (E : GroupActionEvidence G X A) :
  GroupActionClosed G X A := by
  exact And.intro E.continuousClosed (And.intro E.identityActionClosed E.compatibilityClosed)

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse