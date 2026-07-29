import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EcologyMetapopulationDynamicsCanonicalLaneLean.MetapopulationPatchNetwork
import HautevilleHouse.EcologyMetapopulationDynamicsCanonicalLaneLean.OccupancyDynamics

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure MetapopulationCapacity (P : PatchNetwork) where
  carryingCapacity : P.patches → ℝ
  habitatQuality : P.patches → ℝ
  patchCapacity : P.patches → ℝ
  totalCapacity : ℝ

structure MetapopulationCapacityEvidence (P : PatchNetwork) (C : MetapopulationCapacity P) where
  carryingCapacityPositive : ∀ p : P.patches, C.carryingCapacity p > 0
  habitatQualityNonnegative : ∀ p : P.patches, C.habitatQuality p ≥ 0
  patchCapacityDefined : ∀ p : P.patches, C.patchCapacity p = C.carryingCapacity p * C.habitatQuality p
  totalCapacityPositive : C.totalCapacity > 0

def MetapopulationCapacityClosed (P : PatchNetwork) (C : MetapopulationCapacity P) : Prop :=
  (∀ p : P.patches, C.carryingCapacity p > 0) ∧
  (∀ p : P.patches, C.habitatQuality p ≥ 0) ∧
  (∀ p : P.patches, C.patchCapacity p = C.carryingCapacity p * C.habitatQuality p) ∧
  C.totalCapacity > 0

theorem metapopulation_capacity_closed_from_evidence (P : PatchNetwork) (C : MetapopulationCapacity P) (E : MetapopulationCapacityEvidence P C) :
    MetapopulationCapacityClosed P C := by
  exact And.intro E.carryingCapacityPositive (And.intro E.habitatQualityNonnegative (And.intro E.patchCapacityDefined E.totalCapacityPositive))

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse