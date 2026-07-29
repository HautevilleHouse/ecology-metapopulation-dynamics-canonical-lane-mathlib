import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EcologyMetapopulationDynamicsCanonicalLaneLean.MetapopulationPatchNetwork
import HautevilleHouse.EcologyMetapopulationDynamicsCanonicalLaneLean.OccupancyDynamics

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure SpatialMetapopulation (P : PatchNetwork) where
  distanceMatrix : P.patches → P.patches → ℝ
  dispersalKernel : ℝ → ℝ
  emigrationRate : P.patches → ℝ
  immigrationRate : P.patches → ℝ

structure SpatialMetapopulationEvidence (P : PatchNetwork) (S : SpatialMetapopulation P) where
  dispersalKernelPositive : ∀ d : ℝ, d ≥ 0 → S.dispersalKernel d ≥ 0
  emigrationRateNonnegative : ∀ p : P.patches, S.emigrationRate p ≥ 0
  immigrationRateNonnegative : ∀ p : P.patches, S.immigrationRate p ≥ 0
  conservationLaw : (∑ p : P.patches, S.emigrationRate p) = (∑ p : P.patches, S.immigrationRate p)

def SpatialMetapopulationClosed (P : PatchNetwork) (S : SpatialMetapopulation P) : Prop :=
  (∀ d : ℝ, d ≥ 0 → S.dispersalKernel d ≥ 0) ∧
  (∀ p : P.patches, S.emigrationRate p ≥ 0) ∧
  (∀ p : P.patches, S.immigrationRate p ≥ 0) ∧
  ((∑ p : P.patches, S.emigrationRate p) = (∑ p : P.patches, S.immigrationRate p))

theorem spatial_metapopulation_closed_from_evidence (P : PatchNetwork) (S : SpatialMetapopulation P) (E : SpatialMetapopulationEvidence P S) :
    SpatialMetapopulationClosed P S := by
  exact And.intro E.dispersalKernelPositive (And.intro E.emigrationRateNonnegative (And.intro E.immigrationRateNonnegative E.conservationLaw))

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse