import DynamicalSystemsInvolvingTransformationsGroupLean.SpectralTheory

/-!
# Rigidity and Classification Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupLean

structure RigidityClassificationPackage {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} {E : ErgodicTheoremsPackage M}
    {H : EntropyTopologicalPackage M E} {P : MixingPropertiesPackage M E H}
    {S : SpectralTheoryPackage M E H P} where
  classificationTheorem : Prop
  rigidityCriterion : Prop
  orbitEquivalenceClassified : Prop
  modelSpace : Type u
  modelTopology : TopologicalSpace modelSpace
  classifiableToModel : Prop

structure RigidityClassificationEvidence {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} {E : ErgodicTheoremsPackage M}
    {H : EntropyTopologicalPackage M E} {P : MixingPropertiesPackage M E H}
    {S : SpectralTheoryPackage M E H P}
    (R : RigidityClassificationPackage M E H P S) where
  classificationTheoremClosed : R.classificationTheorem
  rigidityCriterionClosed : R.rigidityCriterion
  orbitEquivalenceClassifiedClosed : R.orbitEquivalenceClassified
  classifiableToModelClosed : R.classifiableToModel

def RigidityClassificationClosed {G : TransformationGroupActionsPackage}
    {M : InvariantMeasuresPackage G} {E : ErgodicTheoremsPackage M}
    {H : EntropyTopologicalPackage M E} {P : MixingPropertiesPackage M E H}
    {S : SpectralTheoryPackage M E H P}
    (R : RigidityClassificationPackage M E H P S) : Prop :=
  R.classificationTheorem ∧ R.rigidityCriterion ∧
  R.orbitEquivalenceClassified ∧ R.classifiableToModel

theorem rigidity_classification_closed_from_evidence
    {G : TransformationGroupActionsPackage} {M : InvariantMeasuresPackage G}
    {E : ErgodicTheoremsPackage M} {H : EntropyTopologicalPackage M E}
    {P : MixingPropertiesPackage M E H} {S : SpectralTheoryPackage M E H P}
    (R : RigidityClassificationPackage M E H P S)
    (Ev : RigidityClassificationEvidence R) : RigidityClassificationClosed R := by
  exact And.intro Ev.classificationTheoremClosed
    (And.intro Ev.rigidityCriterionClosed
      (And.intro Ev.orbitEquivalenceClassifiedClosed Ev.classifiableToModelClosed))

end DynamicalSystemsInvolvingTransformationsGroupLean
end HautevilleHouse