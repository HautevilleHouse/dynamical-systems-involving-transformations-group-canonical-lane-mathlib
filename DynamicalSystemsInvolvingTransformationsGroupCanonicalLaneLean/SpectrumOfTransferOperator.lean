import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroup

structure SpectrumOfTransferOperator (M : Type u) [TopologicalSpace M] [MeasureTheory.MeasureSpace M] where
  invariantMeasure : InvariantMeasure M
  operator : (M → ℝ) → (M → ℝ)
  spectralRadius : Prop
  eigenvalueOneMultiplicity : Prop
  discreteSpectrum : Prop

structure SpectrumOfTransferOperatorEvidence (S : SpectrumOfTransferOperator M) where
  spectralRadiusClosed : S.spectralRadius
  eigenvalueOneMultiplicityClosed : S.eigenvalueOneMultiplicity
  discreteSpectrumClosed : S.discreteSpectrum

def SpectrumOfTransferOperatorClosed (S : SpectrumOfTransferOperator M) : Prop :=
  S.spectralRadius ∧ S.eigenvalueOneMultiplicity ∧ S.discreteSpectrum

theorem spectrum_of_transfer_operator_closed_from_evidence
    (S : SpectrumOfTransferOperator M) (E : SpectrumOfTransferOperatorEvidence S) :
    SpectrumOfTransferOperatorClosed S := by
  exact And.intro E.spectralRadiusClosed
    (And.intro E.eigenvalueOneMultiplicityClosed E.discreteSpectrumClosed)

end DynamicalSystemsInvolvingTransformationsGroup
end HautevilleHouse
