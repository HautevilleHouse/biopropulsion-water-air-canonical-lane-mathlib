import canonicalLaneMathlib.AdmissibleClass
import BiopropulsionWaterAirCanonicalLaneLean.FluidDynamics

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure PropulsionEfficiencyPackage where
  thrustCoefficient : Prop
  dragCoefficient : Prop
  liftCoefficient : Prop
  efficiencyFormula : Prop
  optimalCondition : Prop

structure PropulsionEfficiencyEvidence (P : PropulsionEfficiencyPackage) where
  thrustCoefficientClosed : P.thrustCoefficient
  dragCoefficientClosed : P.dragCoefficient
  liftCoefficientClosed : P.liftCoefficient
  efficiencyFormulaClosed : P.efficiencyFormula
  optimalConditionClosed : P.optimalCondition

def PropulsionEfficiencyClosed (P : PropulsionEfficiencyPackage) : Prop :=
  P.thrustCoefficient ∧ P.dragCoefficient ∧ P.liftCoefficient ∧
  P.efficiencyFormula ∧ P.optimalCondition

theorem propulsion_efficiency_closed_from_evidence (P : PropulsionEfficiencyPackage) (E : PropulsionEfficiencyEvidence P) :
    PropulsionEfficiencyClosed P := by
  exact And.intro E.thrustCoefficientClosed
    (And.intro E.dragCoefficientClosed
      (And.intro E.liftCoefficientClosed
        (And.intro E.efficiencyFormulaClosed E.optimalConditionClosed)))

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse