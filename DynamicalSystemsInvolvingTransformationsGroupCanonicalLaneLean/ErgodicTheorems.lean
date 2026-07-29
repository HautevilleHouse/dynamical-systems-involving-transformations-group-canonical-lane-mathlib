import DynamicalSystemsInvolvingTransformationsGroupLean.InvariantMeasures

/-!
# Ergodic Theorems Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupLean

structure ErgodicTheoremsPackage {G : TransformationGroupActionsPackage}
    (M : InvariantMeasuresPackage G) where
  meanErgodicTheorem : Prop
  pointwiseErgodicTheorem : Prop
  vonNeumannErgodicTheorem : Prop
  ergodicDecompositionTheorem : Prop

structure ErgodicTheoremsEvidence {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} (E : ErgodicTheoremsPackage M) where
  meanErgodicTheoremClosed : E.meanErgodicTheorem
  pointwiseErgodicTheoremClosed : E.pointwiseErgodicTheorem
  vonNeumannErgodicTheoremClosed : E.vonNeumannErgodicTheorem
  ergodicDecompositionTheoremClosed : E.ergodicDecompositionTheorem

def ErgodicTheoremsClosed {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} (E : ErgodicTheoremsPackage M) : Prop :=
  E.meanErgodicTheorem ∧ E.pointwiseErgodicTheorem ∧
  E.vonNeumannErgodicTheorem ∧ E.ergodicDecompositionTheorem

theorem ergodic_theorems_closed_from_evidence
    {G : TransformationGroupActionsPackage} {M : InvariantMeasuresPackage G}
    (E : ErgodicTheoremsPackage M) (Ev : ErgodicTheoremsEvidence E) :
    ErgodicTheoremsClosed E := by
  exact And.intro Ev.meanErgodicTheoremClosed
    (And.intro Ev.pointwiseErgodicTheoremClosed
      (And.intro Ev.vonNeumannErgodicTheoremClosed Ev.ergodicDecompositionTheoremClosed))

end DynamicalSystemsInvolvingTransformationsGroupLean
end HautevilleHouse