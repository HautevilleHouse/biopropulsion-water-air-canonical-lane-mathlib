import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure WaterAirDynamicsPackage (P : PropulsionSystemPackage) where
  fluidInteractionModel : Type u
  mixingEfficiency : Prop
  phaseTransitionManaged : Prop
  thermalStability : Prop

structure WaterAirDynamicsEvidence {P : PropulsionSystemPackage}
    (D : WaterAirDynamicsPackage P) where
  mixingEfficiencyClosed : D.mixingEfficiency
  phaseTransitionManagedClosed : D.phaseTransitionManaged
  thermalStabilityClosed : D.thermalStability

def WaterAirDynamicsClosed {P : PropulsionSystemPackage}
    (D : WaterAirDynamicsPackage P) : Prop :=
  D.mixingEfficiency ∧ D.phaseTransitionManaged ∧ D.thermalStability

theorem water_air_dynamics_closed_from_evidence
    {P : PropulsionSystemPackage} (D : WaterAirDynamicsPackage P)
    (E : WaterAirDynamicsEvidence D) : WaterAirDynamicsClosed D := by
  exact And.intro E.mixingEfficiencyClosed
    (And.intro E.phaseTransitionManagedClosed E.thermalStabilityClosed)

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse
