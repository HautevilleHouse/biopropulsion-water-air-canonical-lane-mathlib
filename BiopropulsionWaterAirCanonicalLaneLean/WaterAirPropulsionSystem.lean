import BiopropulsionWaterAirCanonicalLaneLean.WaterAirAdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure PropulsionSystemPackage where
  propellerType : String
  waterFlowRate : Float
  airFlowRate : Float
  thrustProduced : Float
  efficiency : Float

structure PropulsionSystemEvidence (P : PropulsionSystemPackage) where
  waterFlowRateClosed : P.waterFlowRate > 0
  airFlowRateClosed : P.airFlowRate > 0
  thrustProducedClosed : P.thrustProduced > 0
  efficiencyClosed : P.efficiency > 0

def PropulsionSystemClosed (P : PropulsionSystemPackage) : Prop :=
  P.waterFlowRate > 0 ∧ P.airFlowRate > 0 ∧ P.thrustProduced > 0 ∧ P.efficiency > 0

theorem propulsion_system_closed_from_evidence (P : PropulsionSystemPackage)
    (E : PropulsionSystemEvidence P) : PropulsionSystemClosed P := by
  exact And.intro E.waterFlowRateClosed
    (And.intro E.airFlowRateClosed
      (And.intro E.thrustProducedClosed E.efficiencyClosed))

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse