import BiopropulsionWaterAirCanonicalLaneLean.WaterAirThrustEquation

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure EfficiencyPackage where
  outputPower : Float
  inputPower : Float
  efficiency : Float
  efficiencyDefined : efficiency = outputPower / inputPower

structure EfficiencyEvidence (E : EfficiencyPackage) where
  outputPowerClosed : E.outputPower > 0
  inputPowerClosed : E.inputPower > 0
  efficiencyDefinedClosed : E.efficiencyDefined

def EfficiencyClosed (E : EfficiencyPackage) : Prop :=
  E.outputPower > 0 ∧ E.inputPower > 0 ∧ E.efficiencyDefined

theorem efficiency_closed_from_evidence (E : EfficiencyPackage)
    (Ev : EfficiencyEvidence E) : EfficiencyClosed E := by
  exact And.intro Ev.outputPowerClosed
    (And.intro Ev.inputPowerClosed Ev.efficiencyDefinedClosed)

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse