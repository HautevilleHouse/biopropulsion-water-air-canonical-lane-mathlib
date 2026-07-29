import BiopropulsionWaterAirCanonicalLaneLean.ThrustEfficiency

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure InterfaceConditionsPackage {M : FluidPropulsionModel}
    (T : ThrustEfficiencyPackage M) where
  waterAirDensityRatio : ℝ
  surfaceTension : ℝ
  interfaceStability : Prop
  mixingEfficiency : Prop

structure InterfaceConditionsEvidence {M : FluidPropulsionModel}
    {T : ThrustEfficiencyPackage M} (I : InterfaceConditionsPackage T) where
  interfaceStabilityClosed : I.interfaceStability
  mixingEfficiencyClosed : I.mixingEfficiency

def InterfaceConditionsClosed {M : FluidPropulsionModel}
    {T : ThrustEfficiencyPackage M} (I : InterfaceConditionsPackage T) : Prop :=
  I.interfaceStability ∧ I.mixingEfficiency

theorem interface_conditions_closed_from_evidence
    {M : FluidPropulsionModel} {T : ThrustEfficiencyPackage M}
    (I : InterfaceConditionsPackage T) (E : InterfaceConditionsEvidence I) :
    InterfaceConditionsClosed I := by
  exact And.intro E.interfaceStabilityClosed E.mixingEfficiencyClosed

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse