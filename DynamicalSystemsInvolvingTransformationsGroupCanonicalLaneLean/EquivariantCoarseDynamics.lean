import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean

structure EquivariantCoarseDynamicsPackage {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} {O : OrbitClassificationPackage P}
  (T : TopologicalDynamicsPackage O) where
  coarseGeometrySet : Type w
  coarseGeometryTopology : TopologicalSpace coarseGeometrySet
  equivariantCoarseMilnorSchwarz : Prop
  isoperimetricInequalities : Prop
  amenabilityProperties : Prop

structure EquivariantCoarseDynamicsEvidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} {O : OrbitClassificationPackage P}
  (T : TopologicalDynamicsPackage O) (C : EquivariantCoarseDynamicsPackage T) where
  equivariantCoarseMilnorSchwarzClosed : C.equivariantCoarseMilnorSchwarz
  isoperimetricInequalitiesClosed : C.isoperimetricInequalities
  amenabilityPropertiesClosed : C.amenabilityProperties

def EquivariantCoarseDynamicsClosed {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} {O : OrbitClassificationPackage P}
  (T : TopologicalDynamicsPackage O) (C : EquivariantCoarseDynamicsPackage T) : Prop :=
  C.equivariantCoarseMilnorSchwarz ∧ C.isoperimetricInequalities ∧ C.amenabilityProperties

theorem equivariant_coarse_dynamics_closed_from_evidence
  {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
  {P : GroupActionDynamicalSystemPackage G X} {O : OrbitClassificationPackage P}
  (T : TopologicalDynamicsPackage O) (C : EquivariantCoarseDynamicsPackage T)
  (E : EquivariantCoarseDynamicsEvidence T C) : EquivariantCoarseDynamicsClosed T C := by
  exact And.intro E.equivariantCoarseMilnorSchwarzClosed
    (And.intro E.isoperimetricInequalitiesClosed E.amenabilityPropertiesClosed)

end DynamicalSystemsInvolvingTransformationsGroupCanonicalLaneLean
end HautevilleHouse