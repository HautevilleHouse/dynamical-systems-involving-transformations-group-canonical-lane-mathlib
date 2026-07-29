import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure ErgodicDecompositionPackage {G : TransformationsGroupPackage}
    {M : InvariantMeasuresPackage G} where
  ergodicComponents : Type u
  decomposition : Prop
  uniqueness : Prop

structure ErgodicDecompositionEvidence {G : TransformationsGroupPackage}
    {M : InvariantMeasuresPackage G} (D : ErgodicDecompositionPackage M) where
  decompositionClosed : D.decomposition
  uniquenessClosed : D.uniqueness

def ErgodicDecompositionClosed {G : TransformationsGroupPackage}
    {M : InvariantMeasuresPackage G} (D : ErgodicDecompositionPackage M) : Prop :=
  D.decomposition ∧ D.uniqueness

theorem ergodic_decomposition_closed_from_evidence
    {G : TransformationsGroupPackage} {M : InvariantMeasuresPackage G}
    (D : ErgodicDecompositionPackage M) (E : ErgodicDecompositionEvidence D) :
    ErgodicDecompositionClosed D := by
  exact And.intro E.decompositionClosed E.uniquenessClosed

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse