import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure PropulsionSystemPackage where
  propellantType : Type u
  thrustModel : Type v
  efficiencyModel : Type w
  fuelAirMixture : Prop
  waterInjectionFeasible : Prop
  thrustContinuous : Prop

structure PropulsionSystemEvidence (P : PropulsionSystemPackage) where
  fuelAirMixtureClosed : P.fuelAirMixture
  waterInjectionFeasibleClosed : P.waterInjectionFeasible
  thrustContinuousClosed : P.thrustContinuous

def PropulsionSystemClosed (P : PropulsionSystemPackage) : Prop :=
  P.fuelAirMixture ∧ P.waterInjectionFeasible ∧ P.thrustContinuous

theorem propulsion_system_closed_from_evidence
    (P : PropulsionSystemPackage) (E : PropulsionSystemEvidence P) :
    PropulsionSystemClosed P := by
  exact And.intro E.fuelAirMixtureClosed
    (And.intro E.waterInjectionFeasibleClosed E.thrustContinuousClosed)

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse
