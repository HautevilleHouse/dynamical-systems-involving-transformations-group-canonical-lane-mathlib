import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure Ergodicity (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] [MeasurableSpace X]
  (A : GroupActionStructure G X) (M : InvariantMeasure G X A) where
  invariantSetsTrivial : ∀ s : Set X, MeasurableSet s → (∀ g : G, A.action g '' s = s) →
    M.measure s = 0 ∨ M.measure s = M.measure Set.univ
  ergodicDecomposition : Prop

structure ErgodicityEvidence (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] [MeasurableSpace X]
  {A : GroupActionStructure G X} {M : InvariantMeasure G X A} (E : Ergodicity G X A M) where
  invariantSetsTrivialClosed : E.invariantSetsTrivial
  ergodicDecompositionClosed : E.ergodicDecomposition

def ErgodicityClosed (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] [MeasurableSpace X]
  {A : GroupActionStructure G X} {M : InvariantMeasure G X A} (E : Ergodicity G X A M) : Prop :=
  E.invariantSetsTrivial ∧ E.ergodicDecomposition

theorem ergodicity_closed_from_evidence (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] [MeasurableSpace X]
  {A : GroupActionStructure G X} {M : InvariantMeasure G X A} (E : Ergodicity G X A M)
  (Ev : ErgodicityEvidence G X E) : ErgodicityClosed G X E := by
  exact And.intro Ev.invariantSetsTrivialClosed Ev.ergodicDecompositionClosed

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse