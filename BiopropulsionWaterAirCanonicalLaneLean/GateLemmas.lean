import BiopropulsionWaterAirCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

def gateClosed (A : BiopropulsionAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : BiopropulsionAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse