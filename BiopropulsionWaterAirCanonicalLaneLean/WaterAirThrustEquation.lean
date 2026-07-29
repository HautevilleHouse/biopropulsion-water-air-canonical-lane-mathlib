import BiopropulsionWaterAirCanonicalLaneLean.WaterAirPropulsionSystem

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure ThrustEquationPackage where
  momentumChangeWater : Float
  momentumChangeAir : Float
  totalThrust : Float
  thrustConservation : totalThrust = momentumChangeWater + momentumChangeAir

structure ThrustEquationEvidence (T : ThrustEquationPackage) where
  momentumChangeWaterClosed : T.momentumChangeWater > 0
  momentumChangeAirClosed : T.momentumChangeAir > 0
  thrustConservationClosed : T.thrustConservation

def ThrustEquationClosed (T : ThrustEquationPackage) : Prop :=
  T.momentumChangeWater > 0 ∧ T.momentumChangeAir > 0 ∧ T.thrustConservation

theorem thrust_equation_closed_from_evidence (T : ThrustEquationPackage)
    (E : ThrustEquationEvidence T) : ThrustEquationClosed T := by
  exact And.intro E.momentumChangeWaterClosed
    (And.intro E.momentumChangeAirClosed E.thrustConservationClosed)

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse