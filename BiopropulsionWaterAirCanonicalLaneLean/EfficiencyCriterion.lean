import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure EfficiencyCriterionPackage {P : PropulsionSystemPackage}
    (D : WaterAirDynamicsPackage P) where
  specificImpulse : Prop
  combustionEfficiency : Prop
  lossBudget : Prop
  minimalEnergyCondition : Prop

structure EfficiencyCriterionEvidence {P : PropulsionSystemPackage}
    {D : WaterAirDynamicsPackage P} (E : EfficiencyCriterionPackage D) where
  specificImpulseClosed : E.specificImpulse
  combustionEfficiencyClosed : E.combustionEfficiency
  lossBudgetClosed : E.lossBudget
  minimalEnergyConditionClosed : E.minimalEnergyCondition

def EfficiencyCriterionClosed {P : PropulsionSystemPackage}
    {D : WaterAirDynamicsPackage P} (E : EfficiencyCriterionPackage D) : Prop :=
  E.specificImpulse ∧ E.combustionEfficiency ∧
  E.lossBudget ∧ E.minimalEnergyCondition

theorem efficiency_criterion_closed_from_evidence
    {P : PropulsionSystemPackage} {D : WaterAirDynamicsPackage P}
    (E : EfficiencyCriterionPackage D) (Ev : EfficiencyCriterionEvidence E) :
    EfficiencyCriterionClosed E := by
  exact And.intro Ev.specificImpulseClosed
    (And.intro Ev.combustionEfficiencyClosed
      (And.intro Ev.lossBudgetClosed Ev.minimalEnergyConditionClosed))

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse
