import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure InvariantMeasure (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] [MeasurableSpace X]
  (A : GroupActionStructure G X) where
  measure : Measure X
  invariance : ∀ g : G, ∀ s : Set X, MeasurableSet s → measure (A.action g '' s) = measure s
  finiteOnCompact : ∀ K : Set X, IsCompact K → measure K < ∞
  innerRegular : InnerRegular measure

structure InvariantMeasureEvidence (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] [MeasurableSpace X]
  {A : GroupActionStructure G X} (M : InvariantMeasure G X A) where
  invarianceClosed : M.invariance
  finiteOnCompactClosed : M.finiteOnCompact
  innerRegularClosed : M.innerRegular

def InvariantMeasureClosed (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] [MeasurableSpace X]
  {A : GroupActionStructure G X} (M : InvariantMeasure G X A) : Prop :=
  M.invariance ∧ M.finiteOnCompact ∧ M.innerRegular

theorem invariant_measure_closed_from_evidence (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] [MeasurableSpace X]
  {A : GroupActionStructure G X} (M : InvariantMeasure G X A) (E : InvariantMeasureEvidence G X M) :
  InvariantMeasureClosed G X M := by
  exact And.intro E.invarianceClosed (And.intro E.finiteOnCompactClosed E.innerRegularClosed)

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse