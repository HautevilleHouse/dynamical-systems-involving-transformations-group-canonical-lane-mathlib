import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure TransformationsGroupPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  group : Type v
  groupAction : group → manifold → manifold
  differentiableAction : Prop
  invariantMeasures : Prop

structure TransformationsGroupEvidence (G : TransformationsGroupPackage) where
  differentiableActionClosed : G.differentiableAction
  invariantMeasuresClosed : G.invariantMeasures

def TransformationsGroupClosed (G : TransformationsGroupPackage) : Prop :=
  G.differentiableAction ∧ G.invariantMeasures

theorem transformations_group_closed_from_evidence
    (G : TransformationsGroupPackage) (E : TransformationsGroupEvidence G) :
    TransformationsGroupClosed G := by
  exact And.intro E.differentiableActionClosed E.invariantMeasuresClosed

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse