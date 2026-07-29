import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean.TransformationGroupDynamics

/-!
# Ergodic Theory Admissible Package

This module records the ergodic-theoretic invariants (invariant measure,
recurrence, ergodicity) that supplement the transformation group dynamics and
feed into the admissible-class bridge.
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure InvariantMeasure {G : TransformationGroup} {X : PhaseSpace} (ρ : GroupAction G X) where
  measure : MeasureTheory.Measure X.carrier
  invariant : ∀ g : G.carrier, MeasureTheory.MeasurePreserving (ρ.act g) measure measure

structure ErgodicPackage {G : TransformationGroup} {X : PhaseSpace} {ρ : GroupAction G X}
    (μ : InvariantMeasure ρ) where
  ergodic : Prop
  ergodicDecomposition : Prop
  uniqueErgodicIfMinimal : Prop

structure RecurrencePackage {G : TransformationGroup} {X : PhaseSpace} {ρ : GroupAction G X}
    (μ : InvariantMeasure ρ) where
  poincareRecurrence : Prop
  conservativePart : Prop
  dissipativePart : Prop

structure ErgodicAdmissiblePackage {G : TransformationGroup} {X : PhaseSpace}
    (ρ : GroupAction G X) where
  invariantMeasure : InvariantMeasure ρ
  ergodicData : ErgodicPackage invariantMeasure
  recurrenceData : RecurrencePackage invariantMeasure
  ergodicTheoremClosed : Prop
  recurrenceTheoremClosed : Prop
  mixingProperty : Prop

structure ErgodicAdmissibleEvidence (P : ErgodicAdmissiblePackage) where
  ergodicTheoremClosed : P.ergodicTheoremClosed
  recurrenceTheoremClosed : P.recurrenceTheoremClosed
  mixingPropertyClosed : P.mixingProperty

def ErgodicAdmissibleClosed (P : ErgodicAdmissiblePackage) : Prop :=
  P.ergodicTheoremClosed ∧ P.recurrenceTheoremClosed ∧ P.mixingProperty

theorem ergodic_admissible_closed_from_evidence
    (P : ErgodicAdmissiblePackage) (E : ErgodicAdmissibleEvidence P) :
    ErgodicAdmissibleClosed P := by
  exact And.intro E.ergodicTheoremClosed
    (And.intro E.recurrenceTheoremClosed E.mixingPropertyClosed)

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse