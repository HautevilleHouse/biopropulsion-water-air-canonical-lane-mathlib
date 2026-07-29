import BiopropulsionWaterAirCanonicalLaneLean.FluidPropulsion

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure EfficiencyMetricsPackage {P : FluidPropulsionPackage} where
  propulsiveEfficiency : Prop
  thermodynamicEfficiency : Prop
  overallEfficiency : Prop

structure EfficiencyMetricsEvidence {P : FluidPropulsionPackage} (M : EfficiencyMetricsPackage P) where
  propulsiveEfficiencyClosed : M.propulsiveEfficiency
  thermodynamicEfficiencyClosed : M.thermodynamicEfficiency
  overallEfficiencyClosed : M.overallEfficiency

def EfficiencyMetricsClosed {P : FluidPropulsionPackage} (M : EfficiencyMetricsPackage P) : Prop :=
  M.propulsiveEfficiency ∧ M.thermodynamicEfficiency ∧ M.overallEfficiency

theorem efficiency_metrics_closed_from_evidence {P : FluidPropulsionPackage} (M : EfficiencyMetricsPackage P) (E : EfficiencyMetricsEvidence M) :
    EfficiencyMetricsClosed M := by
  exact And.intro E.propulsiveEfficiencyClosed (And.intro E.thermodynamicEfficiencyClosed E.overallEfficiencyClosed)

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse