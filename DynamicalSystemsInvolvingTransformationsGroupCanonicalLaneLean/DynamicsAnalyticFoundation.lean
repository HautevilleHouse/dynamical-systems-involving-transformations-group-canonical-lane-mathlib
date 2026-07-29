import DynamicalSystemsInvolvingTransformationsGroupLean.RigidityClassification

/-!
# Dynamics Analytic Foundation Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupLean

structure DynamicsAnalyticFoundation where
  groupActions : TransformationGroupActionsPackage
  groupActionsEvidence : TransformationGroupActionsEvidence groupActions
  invariantMeasures : InvariantMeasuresPackage groupActions
  invariantMeasuresEvidence : InvariantMeasuresEvidence invariantMeasures
  ergodicTheorems : ErgodicTheoremsPackage invariantMeasures
  ergodicTheoremsEvidence : ErgodicTheoremsEvidence ergodicTheorems
  entropyTopological : EntropyTopologicalPackage invariantMeasures ergodicTheorems
  entropyTopologicalEvidence : EntropyTopologicalEvidence entropyTopological
  mixingProperties : MixingPropertiesPackage invariantMeasures ergodicTheorems entropyTopological
  mixingPropertiesEvidence : MixingPropertiesEvidence mixingProperties
  spectralTheory : SpectralTheoryPackage invariantMeasures ergodicTheorems entropyTopological mixingProperties
  spectralTheoryEvidence : SpectralTheoryEvidence spectralTheory
  rigidityClassification : RigidityClassificationPackage invariantMeasures ergodicTheorems entropyTopological mixingProperties spectralTheory
  rigidityClassificationEvidence : RigidityClassificationEvidence rigidityClassification

def DynamicsAnalyticFoundationClosed (A : DynamicsAnalyticFoundation) : Prop :=
  TransformationGroupActionsClosed A.groupActions ∧
  InvariantMeasuresClosed A.invariantMeasures ∧
  ErgodicTheoremsClosed A.ergodicTheorems ∧
  EntropyTopologicalClosed A.entropyTopological ∧
  MixingPropertiesClosed A.mixingProperties ∧
  SpectralTheoryClosed A.spectralTheory ∧
  RigidityClassificationClosed A.rigidityClassification

theorem dynamics_analytic_foundation_closed_from_evidence
    (A : DynamicsAnalyticFoundation) :
    DynamicsAnalyticFoundationClosed A := by
  exact And.intro (transformation_group_actions_closed_from_evidence A.groupActions A.groupActionsEvidence)
    (And.intro (invariant_measures_closed_from_evidence A.invariantMeasures A.invariantMeasuresEvidence)
      (And.intro (ergodic_theorems_closed_from_evidence A.ergodicTheorems A.ergodicTheoremsEvidence)
        (And.intro (entropy_topological_closed_from_evidence A.entropyTopological A.entropyTopologicalEvidence)
          (And.intro (mixing_properties_closed_from_evidence A.mixingProperties A.mixingPropertiesEvidence)
            (And.intro (spectral_theory_closed_from_evidence A.spectralTheory A.spectralTheoryEvidence)
              (rigidity_classification_closed_from_evidence A.rigidityClassification A.rigidityClassificationEvidence))))))

end DynamicalSystemsInvolvingTransformationsGroupLean
end HautevilleHouse