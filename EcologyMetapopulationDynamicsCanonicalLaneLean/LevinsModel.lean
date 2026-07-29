import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EcologyMetapopulationDynamicsCanonicalLaneLean.MetapopulationPatchNetwork
import HautevilleHouse.EcologyMetapopulationDynamicsCanonicalLaneLean.OccupancyDynamics

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure LevinsModelParameters (P : PatchNetwork) where
  colonizationRate : ℝ
  extinctionRate : ℝ
  equilibriumOccupancy : ℝ
  carryingCapacity : ℝ

structure LevinsModelEvidence (P : PatchNetwork) (L : LevinsModelParameters P) where
  equilibriumOccupancyPositive : L.equilibriumOccupancy > 0
  equilibriumOccupancyLessThanCarrying : L.equilibriumOccupancy < L.carryingCapacity
  colonizationExtinctionRatio : L.colonizationRate / L.extinctionRate = L.equilibriumOccupancy / (1 - L.equilibriumOccupancy)

def LevinsModelClosed (P : PatchNetwork) (L : LevinsModelParameters P) : Prop :=
  L.equilibriumOccupancy > 0 ∧ L.equilibriumOccupancy < L.carryingCapacity

theorem levins_model_closed_from_evidence (P : PatchNetwork) (L : LevinsModelParameters P) (E : LevinsModelEvidence P L) :
    LevinsModelClosed P L := by
  exact And.intro E.equilibriumOccupancyPositive E.equilibriumOccupancyLessThanCarrying

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse