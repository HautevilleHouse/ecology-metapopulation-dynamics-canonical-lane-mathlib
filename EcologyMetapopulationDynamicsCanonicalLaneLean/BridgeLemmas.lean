import canonicalLaneMathlib.AdmissibleClass
import EcologyMetapopulationDynamicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  -- A.object.equilibriumDistribution
  A.object.equilibriumDistribution

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  -- assume A.object has a proof of equilibriumDistribution
  exact A.object.equilibriumDistribution

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse
