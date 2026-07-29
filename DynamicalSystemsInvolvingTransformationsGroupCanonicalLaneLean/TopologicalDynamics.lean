import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure TopologicalDynamicsPackage {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} (O : OrbitClassificationPackage P) where
  topologicalTransitivity : Prop
  minimalSets : Prop
  topologicalEntropyDefined : Prop
  shadowingProperties : Prop
  structuralStability : Prop

structure TopologicalDynamicsEvidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} {O : OrbitClassificationPackage P}
  (T : TopologicalDynamicsPackage O) where
  topologicalTransitivityClosed : T.topologicalTransitivity
  minimalSetsClosed : T.minimalSets
  topologicalEntropyDefinedClosed : T.topologicalEntropyDefined
  shadowingPropertiesClosed : T.shadowingProperties
  structuralStabilityClosed : T.structuralStability

def TopologicalDynamicsClosed {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} {O : OrbitClassificationPackage P}
  (T : TopologicalDynamicsPackage O) : Prop :=
  T.topologicalTransitivity ∧ T.minimalSets ∧ T.topologicalEntropyDefined ∧
  T.shadowingProperties ∧ T.structuralStability

theorem topological_dynamics_closed_from_evidence
  {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} {O : OrbitClassificationPackage P}
  (T : TopologicalDynamicsPackage O) (Ev : TopologicalDynamicsEvidence T) :
  TopologicalDynamicsClosed T := by
  exact And.intro Ev.topologicalTransitivityClosed
    (And.intro Ev.minimalSetsClosed
      (And.intro Ev.topologicalEntropyDefinedClosed
        (And.intro Ev.shadowingPropertiesClosed Ev.structuralStabilityClosed)))

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse