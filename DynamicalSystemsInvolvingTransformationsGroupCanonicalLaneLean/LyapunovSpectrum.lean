import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure LyapunovSpectrumPackage {G : TransformationsGroupPackage}
    {M : InvariantMeasuresPackage G} where
  lyapunovExponents : Type u
  osedeletsTheorem : Prop
  hyperbolicity : Prop

structure LyapunovSpectrumEvidence {G : TransformationsGroupPackage}
    {M : InvariantMeasuresPackage G} (L : LyapunovSpectrumPackage M) where
  osedeletsTheoremClosed : L.osedeletsTheorem
  hyperbolicityClosed : L.hyperbolicity

def LyapunovSpectrumClosed {G : TransformationsGroupPackage}
    {M : InvariantMeasuresPackage G} (L : LyapunovSpectrumPackage M) : Prop :=
  L.osedeletsTheorem ∧ L.hyperbolicity

theorem lyapunov_spectrum_closed_from_evidence
    {G : TransformationsGroupPackage} {M : InvariantMeasuresPackage G}
    (L : LyapunovSpectrumPackage M) (E : LyapunovSpectrumEvidence L) :
    LyapunovSpectrumClosed L := by
  exact And.intro E.osedeletsTheoremClosed E.hyperbolicityClosed

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse