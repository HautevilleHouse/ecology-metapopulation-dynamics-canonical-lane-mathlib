import canonicalLaneMathlib.AdmissibleClass
import EcologyMetapopulationDynamicsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse
