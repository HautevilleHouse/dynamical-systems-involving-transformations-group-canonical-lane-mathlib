import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure TopologicalEntropyPackage {G : TransformationsGroupPackage} where
  entropyDefined : Prop
  entropyInvariance : Prop
  variationalPrinciple : Prop

structure TopologicalEntropyEvidence {G : TransformationsGroupPackage}
    (E : TopologicalEntropyPackage G) where
  entropyDefinedClosed : E.entropyDefined
  entropyInvarianceClosed : E.entropyInvariance
  variationalPrincipleClosed : E.variationalPrinciple

def TopologicalEntropyClosed {G : TransformationsGroupPackage}
    (E : TopologicalEntropyPackage G) : Prop :=
  E.entropyDefined ∧ E.entropyInvariance ∧ E.variationalPrinciple

theorem topological_entropy_closed_from_evidence
    {G : TransformationsGroupPackage} (E : TopologicalEntropyPackage G)
    (Ev : TopologicalEntropyEvidence E) : TopologicalEntropyClosed E := by
  exact And.intro Ev.entropyDefinedClosed
    (And.intro Ev.entropyInvarianceClosed Ev.variationalPrincipleClosed)

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse