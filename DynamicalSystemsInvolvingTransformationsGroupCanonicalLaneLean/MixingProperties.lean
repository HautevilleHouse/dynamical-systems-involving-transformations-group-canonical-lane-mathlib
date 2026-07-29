import DynamicalSystemsInvolvingTransformationsGroupLean.EntropyTopological

/-!
# Mixing Properties Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupLean

structure MixingPropertiesPackage {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} {E : ErgodicTheoremsPackage M}
    {H : EntropyTopologicalPackage M E} where
  strongMixing : Prop
  weakMixing : Prop
  mixingImpliesErgodic : Prop
  mixingPreservedUnderFactor : Prop

structure MixingPropertiesEvidence {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} {E : ErgodicTheoremsPackage M}
    {H : EntropyTopologicalPackage M E} (P : MixingPropertiesPackage M E H) where
  strongMixingClosed : P.strongMixing
  weakMixingClosed : P.weakMixing
  mixingImpliesErgodicClosed : P.mixingImpliesErgodic
  mixingPreservedUnderFactorClosed : P.mixingPreservedUnderFactor

def MixingPropertiesClosed {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} {E : ErgodicTheoremsPackage M}
    {H : EntropyTopologicalPackage M E} (P : MixingPropertiesPackage M E H) : Prop :=
  P.strongMixing ∧ P.weakMixing ∧ P.mixingImpliesErgodic ∧ P.mixingPreservedUnderFactor

theorem mixing_properties_closed_from_evidence
    {G : TransformationGroupActionsPackage} {M : InvariantMeasuresPackage G}
    {E : ErgodicTheoremsPackage M} {H : EntropyTopologicalPackage M E}
    (P : MixingPropertiesPackage M E H) (Ev : MixingPropertiesEvidence P) :
    MixingPropertiesClosed P := by
  exact And.intro Ev.strongMixingClosed
    (And.intro Ev.weakMixingClosed
      (And.intro Ev.mixingImpliesErgodicClosed Ev.mixingPreservedUnderFactorClosed))

end DynamicalSystemsInvolvingTransformationsGroupLean
end HautevilleHouse