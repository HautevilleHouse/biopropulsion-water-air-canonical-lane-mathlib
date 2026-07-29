import BiopropulsionWaterAirCanonicalLaneLean.FluidPropulsionModel

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure ThrustEfficiencyPackage (M : FluidPropulsionModel) where
  thrustEquation : ℝ → ℝ
  thrustAtCondition : Prop
  efficiencyAtCondition : Prop

structure ThrustEfficiencyEvidence {M : FluidPropulsionModel}
    (T : ThrustEfficiencyPackage M) where
  thrustAtConditionClosed : T.thrustAtCondition
  efficiencyAtConditionClosed : T.efficiencyAtCondition

def ThrustEfficiencyClosed {M : FluidPropulsionModel}
    (T : ThrustEfficiencyPackage M) : Prop :=
  T.thrustAtCondition ∧ T.efficiencyAtCondition

theorem thrust_efficiency_closed_from_evidence
    {M : FluidPropulsionModel} (T : ThrustEfficiencyPackage M)
    (E : ThrustEfficiencyEvidence T) : ThrustEfficiencyClosed T := by
  exact And.intro E.thrustAtConditionClosed E.efficiencyAtConditionClosed

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse