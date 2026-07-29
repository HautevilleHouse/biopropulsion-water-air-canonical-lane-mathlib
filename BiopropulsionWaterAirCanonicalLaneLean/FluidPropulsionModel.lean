import BiopropulsionWaterAirCanonicalLaneLean.BiopropulsionAdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure FluidPropulsionModel where
  inletArea : ℝ
  outletArea : ℝ
  massFlowRate : ℝ
  thrustCoefficient : ℝ
  efficiency : ℝ

structure FluidPropulsionEvidence (M : FluidPropulsionModel) where
  inletAreaPositive : M.inletArea > 0
  outletAreaPositive : M.outletArea > 0
  massFlowRatePositive : M.massFlowRate > 0
  thrustCoefficientPositive : M.thrustCoefficient > 0
  efficiencyBetweenZeroAndOne : 0 ≤ M.efficiency ∧ M.efficiency ≤ 1

def FluidPropulsionModelClosed (M : FluidPropulsionModel) : Prop :=
  M.inletArea > 0 ∧ M.outletArea > 0 ∧ M.massFlowRate > 0 ∧
  M.thrustCoefficient > 0 ∧ (0 ≤ M.efficiency ∧ M.efficiency ≤ 1)

theorem fluid_propulsion_closed_from_evidence (M : FluidPropulsionModel)
    (E : FluidPropulsionEvidence M) : FluidPropulsionModelClosed M := by
  exact And.intro E.inletAreaPositive
    (And.intro E.outletAreaPositive
      (And.intro E.massFlowRatePositive
        (And.intro E.thrustCoefficientPositive
          (And.intro E.efficiencyBetweenZeroAndOne.1 E.efficiencyBetweenZeroAndOne.2))))

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse