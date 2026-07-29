import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure OrbitClassificationPackage {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  (P : GroupActionDynamicalSystemPackage G X) where
  orbitTypesClassified : Prop
  stabilizerSubgroups : Prop
  orbitSpaceQuotient : Type w
  orbitSpaceTopology : TopologicalSpace orbitSpaceQuotient
  quotientMapContinuous : Prop
  orbitStructureClosed : Prop

structure OrbitClassificationEvidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} (O : OrbitClassificationPackage P) where
  orbitTypesClassifiedClosed : O.orbitTypesClassified
  stabilizerSubgroupsClosed : O.stabilizerSubgroups
  orbitStructureClosedClosed : O.orbitStructureClosed

def OrbitClassificationClosed {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} (O : OrbitClassificationPackage P) : Prop :=
  O.orbitTypesClassified ∧ O.stabilizerSubgroups ∧ O.orbitStructureClosed

theorem orbit_classification_closed_from_evidence
  {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} (O : OrbitClassificationPackage P)
  (E : OrbitClassificationEvidence O) : OrbitClassificationClosed O := by
  exact And.intro E.orbitTypesClassifiedClosed
    (And.intro E.stabilizerSubgroupsClosed E.orbitStructureClosedClosed)

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse