import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure ControlConstraintsPackage {P : PropulsionSystemPackage}
    {D : WaterAirDynamicsPackage P} (E : EfficiencyCriterionPackage D) where
  valveTimingConstraint : Prop
  mixtureRatioBound : Prop
  chamberPressureLimit : Prop
  temperatureLimit : Prop

structure ControlConstraintsEvidence {P : PropulsionSystemPackage}
    {D : WaterAirDynamicsPackage P} {E : EfficiencyCriterionPackage D}
    (C : ControlConstraintsPackage E) where
  valveTimingConstraintClosed : C.valveTimingConstraint
  mixtureRatioBoundClosed : C.mixtureRatioBound
  chamberPressureLimitClosed : C.chamberPressureLimit
  temperatureLimitClosed : C.temperatureLimit

def ControlConstraintsClosed {P : PropulsionSystemPackage}
    {D : WaterAirDynamicsPackage P} {E : EfficiencyCriterionPackage D}
    (C : ControlConstraintsPackage E) : Prop :=
  C.valveTimingConstraint ∧ C.mixtureRatioBound ∧
  C.chamberPressureLimit ∧ C.temperatureLimit

theorem control_constraints_closed_from_evidence
    {P : PropulsionSystemPackage} {D : WaterAirDynamicsPackage P}
    {E : EfficiencyCriterionPackage D} (C : ControlConstraintsPackage E)
    (Ev : ControlConstraintsEvidence C) : ControlConstraintsClosed C := by
  exact And.intro Ev.valveTimingConstraintClosed
    (And.intro Ev.mixtureRatioBoundClosed
      (And.intro Ev.chamberPressureLimitClosed Ev.temperatureLimitClosed))

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse
