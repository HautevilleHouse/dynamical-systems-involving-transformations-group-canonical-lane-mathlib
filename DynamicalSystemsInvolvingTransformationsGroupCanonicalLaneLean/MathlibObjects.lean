import DynamicalSystemsInvolvingTransformationsGroupLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DynamicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DynamicsAdmittedObject where
  space : DynamicsSpace
  groupAction : Prop
  invariantMeasure : Prop
  ergodicDecomposition : Prop
  classificationModel : Type
  classificationTopology : TopologicalSpace classificationModel
  classifiableToModel : Prop
  conclusion : classifiableToModel

structure DynamicsEndgameState where
  object : DynamicsAdmittedObject

def DynamicsWitnessClosed (O : DynamicsAdmittedObject) : Prop :=
  O.classifiableToModel

end DynamicalSystemsInvolvingTransformationsGroupLean
end HautevilleHouse