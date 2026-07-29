import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure TopologicalTransitivity (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
  (A : GroupActionStructure G X) where
  denseOrbit : ∃ x : X, Dense (orbit G A.action x)
  minimality : ∀ U V : Set X, U.Nonempty → V.Nonempty → IsOpen U → IsOpen V →
    ∃ g : G, (A.action g '' U) ∩ V ≠ ∅

theorem transitivity_implies_dense_orbits (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
  (A : GroupActionStructure G X) (T : TopologicalTransitivity G X A) :
  ∃ x : X, Dense (orbit G A.action x) := T.denseOrbit

structure TopologicalTransitivityEvidence (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
  {A : GroupActionStructure G X} (T : TopologicalTransitivity G X A) where
  denseOrbitClosed : T.denseOrbit
  minimalityClosed : T.minimality

def TopologicalTransitivityClosed (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
  {A : GroupActionStructure G X} (T : TopologicalTransitivity G X A) : Prop :=
  T.denseOrbit ∧ T.minimality

theorem topological_transitivity_closed_from_evidence (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
  {A : GroupActionStructure G X} (T : TopologicalTransitivity G X A) (E : TopologicalTransitivityEvidence G X T) :
  TopologicalTransitivityClosed G X T := by
  exact And.intro E.denseOrbitClosed E.minimalityClosed

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse