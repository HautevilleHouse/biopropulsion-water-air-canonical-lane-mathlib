import WaterAirSystem

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure PropulsionModelPackage (S: WaterAirSystemPackage) where
  thrustForce: ℝ
  massFlowRate: ℝ
  exhaustVelocity: ℝ
  thrustRelation: thrustForce = massFlowRate * exhaustVelocity
  efficiency: ℝ
  efficiencyWithinBounds: efficiency > 0 ∧ efficiency < 1

structure PropulsionModelEvidence {S: WaterAirSystemPackage} (P: PropulsionModelPackage S) where
  thrustRelationClosed: P.thrustRelation
  efficiencyWithinBoundsClosed: P.efficiencyWithinBounds

def PropulsionModelClosed {S: WaterAirSystemPackage} (P: PropulsionModelPackage S): Prop :=
  P.thrustRelation ∧ P.efficiencyWithinBounds

theorem propulsion_model_closed_from_evidence
  {S: WaterAirSystemPackage} (P: PropulsionModelPackage S) (E: PropulsionModelEvidence P): PropulsionModelClosed P := by
  exact And.intro E.thrustRelationClosed E.efficiencyWithinBoundsClosed

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse
