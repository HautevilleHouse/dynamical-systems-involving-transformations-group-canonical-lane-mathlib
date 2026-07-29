import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure ErgodicTheoryPackage {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} (O : OrbitClassificationPackage P) where
  ergodicDecomposition : Prop
  invariantMeasuresCharacterized : Prop
  ergodicTheoremsEstablished : Prop
  mixingHierarchy : Prop

structure ErgodicTheoryEvidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} {O : OrbitClassificationPackage P}
  (E : ErgodicTheoryPackage O) where
  ergodicDecompositionClosed : E.ergodicDecomposition
  invariantMeasuresCharacterizedClosed : E.invariantMeasuresCharacterized
  ergodicTheoremsEstablishedClosed : E.ergodicTheoremsEstablished
  mixingHierarchyClosed : E.mixingHierarchy

def ErgodicTheoryClosed {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} {O : OrbitClassificationPackage P}
  (E : ErgodicTheoryPackage O) : Prop :=
  E.ergodicDecomposition ∧ E.invariantMeasuresCharacterized ∧
  E.ergodicTheoremsEstablished ∧ E.mixingHierarchy

theorem ergodic_theory_closed_from_evidence
  {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} {O : OrbitClassificationPackage P}
  (E : ErgodicTheoryPackage O) (Ev : ErgodicTheoryEvidence E) : ErgodicTheoryClosed E := by
  exact And.intro Ev.ergodicDecompositionClosed
    (And.intro Ev.invariantMeasuresCharacterizedClosed
      (And.intro Ev.ergodicTheoremsEstablishedClosed Ev.mixingHierarchyClosed))

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse