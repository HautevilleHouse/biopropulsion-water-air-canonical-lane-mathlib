import BiopropulsionWaterAirCanonicalLaneLean.EfficiencyMetrics

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure ThrustAnalysisPackage {P : FluidPropulsionPackage} {M : EfficiencyMetricsPackage P} where
  thrustForce : Prop
  specificImpulse : Prop
  thrustToWeightRatio : Prop

structure ThrustAnalysisEvidence {P : FluidPropulsionPackage} {M : EfficiencyMetricsPackage P} (T : ThrustAnalysisPackage M) where
  thrustForceClosed : T.thrustForce
  specificImpulseClosed : T.specificImpulse
  thrustToWeightRatioClosed : T.thrustToWeightRatio

def ThrustAnalysisClosed {P : FluidPropulsionPackage} {M : EfficiencyMetricsPackage P} (T : ThrustAnalysisPackage M) : Prop :=
  T.thrustForce ∧ T.specificImpulse ∧ T.thrustToWeightRatio

theorem thrust_analysis_closed_from_evidence {P : FluidPropulsionPackage} {M : EfficiencyMetricsPackage P} (T : ThrustAnalysisPackage M) (E : ThrustAnalysisEvidence T) :
    ThrustAnalysisClosed T := by
  exact And.intro E.thrustForceClosed (And.intro E.specificImpulseClosed E.thrustToWeightRatioClosed)

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse