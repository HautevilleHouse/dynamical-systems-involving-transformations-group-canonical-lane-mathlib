import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure InvariantMeasuresPackage {G : TransformationsGroupPackage} where
  measure : Type w
  invarianceUnderAction : Prop
  ergodicity : Prop
  mixing : Prop

structure InvariantMeasuresEvidence {G : TransformationsGroupPackage}
    (M : InvariantMeasuresPackage G) where
  invarianceUnderActionClosed : M.invarianceUnderAction
  ergodicityClosed : M.ergodicity
  mixingClosed : M.mixing

def InvariantMeasuresClosed {G : TransformationsGroupPackage}
    (M : InvariantMeasuresPackage G) : Prop :=
  M.invarianceUnderAction ∧ M.ergodicity ∧ M.mixing

theorem invariant_measures_closed_from_evidence
    {G : TransformationsGroupPackage} (M : InvariantMeasuresPackage G)
    (E : InvariantMeasuresEvidence M) : InvariantMeasuresClosed M := by
  exact And.intro E.invarianceUnderActionClosed
    (And.intro E.ergodicityClosed E.mixingClosed)

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse