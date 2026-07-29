import canonicalLaneMathlib.AdmissibleClass
import BiopropulsionWaterAirCanonicalLaneLean.WaterAirBridgeLemmas

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem water_air_gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse