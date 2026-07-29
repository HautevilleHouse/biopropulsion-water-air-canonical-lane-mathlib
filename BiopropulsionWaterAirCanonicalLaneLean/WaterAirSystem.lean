import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure WaterAirSystemPackage where
  densityWater: ℝ
  densityAir: ℝ
  viscosityWater: ℝ
  viscosityAir: ℝ
  flowRegime: Prop

structure WaterAirSystemEvidence (S: WaterAirSystemPackage) where
  densityWaterPositive: S.densityWater > 0
  densityAirPositive: S.densityAir > 0
  viscosityWaterPositive: S.viscosityWater > 0
  viscosityAirPositive: S.viscosityAir > 0
  flowRegimeClosed: S.flowRegime

def WaterAirSystemClosed (S: WaterAirSystemPackage): Prop :=
  S.densityWater > 0 ∧ S.densityAir > 0 ∧ S.viscosityWater > 0 ∧ S.viscosityAir > 0 ∧ S.flowRegime

theorem water_air_system_closed_from_evidence
  (S: WaterAirSystemPackage) (E: WaterAirSystemEvidence S): WaterAirSystemClosed S := by
  exact And.intro E.densityWaterPositive (And.intro E.densityAirPositive
    (And.intro E.viscosityWaterPositive (And.intro E.viscosityAirPositive E.flowRegimeClosed)))

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse
