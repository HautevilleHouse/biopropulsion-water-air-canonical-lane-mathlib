import canonicalLaneMathlib.AdmissibleClass
import BiopropulsionWaterAirCanonicalLaneLean.PropulsionEfficiency

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure BioMechanicsPackage where
  wingKinematics : Prop
  finOscillation : Prop
  muscleActuation : Prop
  bodyDeformation : Prop
  energyConsumption : Prop

structure BioMechanicsEvidence (B : BioMechanicsPackage) where
  wingKinematicsClosed : B.wingKinematics
  finOscillationClosed : B.finOscillation
  muscleActuationClosed : B.muscleActuation
  bodyDeformationClosed : B.bodyDeformation
  energyConsumptionClosed : B.energyConsumption

def BioMechanicsClosed (B : BioMechanicsPackage) : Prop :=
  B.wingKinematics ∧ B.finOscillation ∧ B.muscleActuation ∧
  B.bodyDeformation ∧ B.energyConsumption

theorem bio_mechanics_closed_from_evidence (B : BioMechanicsPackage) (E : BioMechanicsEvidence B) :
    BioMechanicsClosed B := by
  exact And.intro E.wingKinematicsClosed
    (And.intro E.finOscillationClosed
      (And.intro E.muscleActuationClosed
        (And.intro E.bodyDeformationClosed E.energyConsumptionClosed)))

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse