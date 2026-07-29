import DynamicalSystemsInvolvingTransformationsGroupLean.MixingProperties

/-!
# Spectral Theory Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupLean

structure SpectralTheoryPackage {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} {E : ErgodicTheoremsPackage M}
    {H : EntropyTopologicalPackage M E} {P : MixingPropertiesPackage M E H} where
  unitaryOperator : Type u
  spectralMeasure : Type v
  spectralDecomposition : Prop
  discreteSpectrum : Prop
  continuousSpectrum : Prop
  mixingSpectralCharacterization : Prop

structure SpectralTheoryEvidence {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} {E : ErgodicTheoremsPackage M}
    {H : EntropyTopologicalPackage M E} {P : MixingPropertiesPackage M E H}
    (S : SpectralTheoryPackage M E H P) where
  spectralDecompositionClosed : S.spectralDecomposition
  discreteSpectrumClosed : S.discreteSpectrum
  continuousSpectrumClosed : S.continuousSpectrum
  mixingSpectralCharacterizationClosed : S.mixingSpectralCharacterization

def SpectralTheoryClosed {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} {E : ErgodicTheoremsPackage M}
    {H : EntropyTopologicalPackage M E} {P : MixingPropertiesPackage M E H}
    (S : SpectralTheoryPackage M E H P) : Prop :=
  S.spectralDecomposition ∧ S.discreteSpectrum ∧
  S.continuousSpectrum ∧ S.mixingSpectralCharacterization

theorem spectral_theory_closed_from_evidence
    {G : TransformationGroupActionsPackage} {M : InvariantMeasuresPackage G}
    {E : ErgodicTheoremsPackage M} {H : EntropyTopologicalPackage M E}
    {P : MixingPropertiesPackage M E H} (S : SpectralTheoryPackage M E H P)
    (Ev : SpectralTheoryEvidence S) : SpectralTheoryClosed S := by
  exact And.intro Ev.spectralDecompositionClosed
    (And.intro Ev.discreteSpectrumClosed
      (And.intro Ev.continuousSpectrumClosed Ev.mixingSpectralCharacterizationClosed))

end DynamicalSystemsInvolvingTransformationsGroupLean
end HautevilleHouse