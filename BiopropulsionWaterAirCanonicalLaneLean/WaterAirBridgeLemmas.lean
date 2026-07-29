import canonicalLaneMathlib.AdmissibleClass
import BiopropulsionWaterAirCanonicalLaneLean.WaterAirAdmissibleClass

namespace HautevilleHouse
namespace BiopropulsionWaterAirCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  WaterAirWitnessClosed A.object

theorem water_air_bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BiopropulsionWaterAirCanonicalLaneLean
end HautevilleHouse