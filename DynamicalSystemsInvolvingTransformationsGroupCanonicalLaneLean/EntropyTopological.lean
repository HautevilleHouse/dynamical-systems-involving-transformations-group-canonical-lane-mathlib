import DynamicalSystemsInvolvingTransformationsGroupLean.ErgodicTheorems

/-!
# Topological Entropy Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupLean

structure EntropyTopologicalPackage {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} {E : ErgodicTheoremsPackage M} where
  topologicalEntropyDefined : Prop
  measureTheoreticEntropy : Prop
  variationalPrinciple : Prop
  entropyDistinguishesMixing : Prop

structure EntropyTopologicalEvidence {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} {E : ErgodicTheoremsPackage M}
    (H : EntropyTopologicalPackage M E) where
  topologicalEntropyDefinedClosed : H.topologicalEntropyDefined
  measureTheoreticEntropyClosed : H.measureTheoreticEntropy
  variationalPrincipleClosed : H.variationalPrinciple
  entropyDistinguishesMixingClosed : H.entropyDistinguishesMixing

def EntropyTopologicalClosed {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} {E : ErgodicTheoremsPackage M}
    (H : EntropyTopologicalPackage M E) : Prop :=
  H.topologicalEntropyDefined ∧ H.measureTheoreticEntropy ∧
  H.variationalPrinciple ∧ H.entropyDistinguishesMixing

theorem entropy_topological_closed_from_evidence
    {G : TransformationGroupActionsPackage} {M : InvariantMeasuresPackage G}
    {E : ErgodicTheoremsPackage M} (H : EntropyTopologicalPackage M E)
    (Ev : EntropyTopologicalEvidence H) : EntropyTopologicalClosed H := by
  exact And.intro Ev.topologicalEntropyDefinedClosed
    (And.intro Ev.measureTheoreticEntropyClosed
      (And.intro Ev.variationalPrincipleClosed Ev.entropyDistinguishesMixingClosed))

end DynamicalSystemsInvolvingTransformationsGroupLean
end HautevilleHouse