import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure KMSystem (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] [MeasurableSpace X]
  (A : GroupActionStructure G X) (M : InvariantMeasure G X A) (E : Ergodicity G X A M) where
  entropy : ℝ
  ksEntropyFormula : Prop
  positivityOfEntropy : Prop
  kolmogorovSinaiTheorem : Prop

structure KMSystemEvidence (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] [MeasurableSpace X]
  {A : GroupActionStructure G X} {M : InvariantMeasure G X A} {E : Ergodicity G X A M}
  (K : KMSystem G X A M E) where
  ksEntropyFormulaClosed : K.ksEntropyFormula
  positivityOfEntropyClosed : K.positivityOfEntropy
  kolmogorovSinaiTheoremClosed : K.kolmogorovSinaiTheorem

def KMSystemClosed (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] [MeasurableSpace X]
  {A : GroupActionStructure G X} {M : InvariantMeasure G X A} {E : Ergodicity G X A M}
  (K : KMSystem G X A M E) : Prop :=
  K.ksEntropyFormula ∧ K.positivityOfEntropy ∧ K.kolmogorovSinaiTheorem

theorem kmsystem_closed_from_evidence (G : Type u) [Group G] (X : Type v) [TopologicalSpace X] [MeasurableSpace X]
  {A : GroupActionStructure G X} {M : InvariantMeasure G X A} {E : Ergodicity G X A M}
  (K : KMSystem G X A M E) (Ev : KMSystemEvidence G X K) : KMSystemClosed G X K := by
  exact And.intro Ev.ksEntropyFormulaClosed (And.intro Ev.positivityOfEntropyClosed Ev.kolmogorovSinaiTheoremClosed)

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse