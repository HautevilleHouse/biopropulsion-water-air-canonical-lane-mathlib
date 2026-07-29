import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

structure FluidDynamicsPackage where
  fluidType : Type u
  viscosity : Prop
  density : Prop
  navierStokesEquation : Prop
  continuityEquation : Prop

structure FluidDynamicsEvidence (F : FluidDynamicsPackage) where
  viscosityClosed : F.viscosity
  densityClosed : F.density
  navierStokesEquationClosed : F.navierStokesEquation
  continuityEquationClosed : F.continuityEquation

def FluidDynamicsClosed (F : FluidDynamicsPackage) : Prop :=
  F.viscosity ∧ F.density ∧ F.navierStokesEquation ∧ F.continuityEquation

theorem fluid_dynamics_closed_from_evidence (F : FluidDynamicsPackage) (E : FluidDynamicsEvidence F) :
    FluidDynamicsClosed F := by
  exact And.intro E.viscosityClosed
    (And.intro E.densityClosed
      (And.intro E.navierStokesEquationClosed E.continuityEquationClosed))

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse