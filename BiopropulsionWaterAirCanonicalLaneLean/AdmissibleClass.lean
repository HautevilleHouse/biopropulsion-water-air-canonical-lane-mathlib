import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BiopropulsionAdmittedObject where
  carrier : Type
  topology : TopologicalSpace carrier
  fluidDomain : Type
  fluidTopology : TopologicalSpace fluidDomain
  propulsionMechanism : Prop
  efficiencyBound : Prop
  conclusion : efficiencyBound

structure BiopropulsionEndgameState where
  object : BiopropulsionAdmittedObject

def BiopropulsionWitnessClosed (O : BiopropulsionAdmittedObject) : Prop :=
  O.efficiencyBound

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse