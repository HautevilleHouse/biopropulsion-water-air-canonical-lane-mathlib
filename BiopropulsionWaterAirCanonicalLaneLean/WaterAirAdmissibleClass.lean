import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure WaterAirAdmittedObject where
  propellerType : String
  waterFlowRate : Float
  airFlowRate : Float
  thrustProduced : Float
  conclusion : thrustProduced > 0

structure AdmissibleClass where
  object : WaterAirAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  WaterAirWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse