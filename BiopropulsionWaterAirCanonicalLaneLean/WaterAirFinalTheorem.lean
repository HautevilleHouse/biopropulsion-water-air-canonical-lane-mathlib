import BiopropulsionWaterAirCanonicalLaneLean.WaterAirGateLemmas

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

def ConstrainedWaterAirPropulsionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_water_air_endgame (A : AdmissibleClass) :
    ConstrainedWaterAirPropulsionClosure A := by
  exact And.intro (water_air_bridge_from_admissible_class A) (water_air_gate_from_admissible_class A)

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse