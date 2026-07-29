import BiopropulsionWaterAirCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure FluidPropulsionPackage where
  fluidDensity : Prop
  flowVelocity : Prop
  reynoldsNumber : Prop
  dragCoefficient : Prop

structure FluidPropulsionEvidence (P : FluidPropulsionPackage) where
  fluidDensityClosed : P.fluidDensity
  flowVelocityClosed : P.flowVelocity
  reynoldsNumberClosed : P.reynoldsNumber
  dragCoefficientClosed : P.dragCoefficient

def FluidPropulsionClosed (P : FluidPropulsionPackage) : Prop :=
  P.fluidDensity ∧ P.flowVelocity ∧ P.reynoldsNumber ∧ P.dragCoefficient

theorem fluid_propulsion_closed_from_evidence (P : FluidPropulsionPackage) (E : FluidPropulsionEvidence P) :
    FluidPropulsionClosed P := by
  exact And.intro E.fluidDensityClosed (And.intro E.flowVelocityClosed (And.intro E.reynoldsNumberClosed E.dragCoefficientClosed))

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse