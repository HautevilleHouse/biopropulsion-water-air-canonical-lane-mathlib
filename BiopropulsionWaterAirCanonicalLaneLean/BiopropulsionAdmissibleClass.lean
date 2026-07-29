import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BiopropulsionAdmittedObject where
  fluid : Type
  density : fluid → ℝ
  velocity : fluid → ℝ³
  thrust : ℝ
  thrustDerived : Prop

structure BiopropulsionAdmissibleClass where
  object : BiopropulsionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : BiopropulsionAdmissibleClass) : Prop :=
  (A.object.thrustDerived) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse