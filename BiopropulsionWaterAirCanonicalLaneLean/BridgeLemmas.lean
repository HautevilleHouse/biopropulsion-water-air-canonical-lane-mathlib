import BiopropulsionWaterAirCanonicalLaneLean.BiopropulsionAdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

def bridgeClosed (A : BiopropulsionAdmissibleClass) : Prop :=
  A.object.thrustDerived

theorem bridge_from_admissible_class (A : BiopropulsionAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.thrustDerived

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse