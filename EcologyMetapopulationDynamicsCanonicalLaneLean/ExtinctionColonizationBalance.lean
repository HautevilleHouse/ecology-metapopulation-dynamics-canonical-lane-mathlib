import canonicallaneMathlib.AdmissibleClass
import EcologyMetapopulationDynamicsCanonicalLaneLean.HabitatPatchDynamics
import EcologyMetapopulationDynamicsCanonicalLaneLean.MetapopulationConnectivity

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure ExtinctionColonizationBalancePackage {P : HabitatPatchDynamicsPackage}
    (C : MetapopulationConnectivityPackage) where
  extinctionColonizationRatio : Prop
  equilibriumOccupancy : Prop
  metapopulationCapacity : Prop
  stabilityCondition : Prop

structure ExtinctionColonizationBalanceEvidence {P : HabitatPatchDynamicsPackage}
    {C : MetapopulationConnectivityPackage} (B : ExtinctionColonizationBalancePackage C) where
  extinctionColonizationRatioClosed : B.extinctionColonizationRatio
  equilibriumOccupancyClosed : B.equilibriumOccupancy
  metapopulationCapacityClosed : B.metapopulationCapacity
  stabilityConditionClosed : B.stabilityCondition

def ExtinctionColonizationBalanceClosed {P : HabitatPatchDynamicsPackage}
    {C : MetapopulationConnectivityPackage} (B : ExtinctionColonizationBalancePackage C) : Prop :=
  B.extinctionColonizationRatio ∧ B.equilibriumOccupancy ∧
  B.metapopulationCapacity ∧ B.stabilityCondition

theorem extinction_colonization_balance_closed_from_evidence
    {P : HabitatPatchDynamicsPackage} {C : MetapopulationConnectivityPackage}
    (B : ExtinctionColonizationBalancePackage C) (E : ExtinctionColonizationBalanceEvidence B) :
    ExtinctionColonizationBalanceClosed B := by
  exact And.intro E.extinctionColonizationRatioClosed
    (And.intro E.equilibriumOccupancyClosed
      (And.intro E.metapopulationCapacityClosed E.stabilityConditionClosed))

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse
