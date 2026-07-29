import canonicalLaneMathlib.AdmissibleClass
import WaterAirSystem
import PropulsionModel

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure BiopropulsionAdmittedObject where
  system: WaterAirSystemPackage
  model: PropulsionModelPackage system
  systemClosed: WaterAirSystemClosed system
  modelClosed: PropulsionModelClosed model

structure BiopropulsionAdmissibleClass where
  object: BiopropulsionAdmittedObject
  endpointSatisfied: Prop
  remainderRecorded: Prop
  gateWitness: endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A: BiopropulsionAdmissibleClass): Prop :=
  let O := A.object
  O.systemClosed ∧ O.modelClosed

theorem bridge_from_admissible_class (A: BiopropulsionAdmissibleClass): bridgeClosed A := by
  exact And.intro A.object.systemClosed A.object.modelClosed

def gateClosed (A: BiopropulsionAdmissibleClass): Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A: BiopropulsionAdmissibleClass): gateClosed A := by
  exact A.gateWitness

def ConstrainedBiopropulsionClosure (A: BiopropulsionAdmissibleClass): Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_biopropulsion_endgame (A: BiopropulsionAdmissibleClass): ConstrainedBiopropulsionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse
