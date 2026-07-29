import canonicalLaneMathlib.AdmissibleClass
import EcologyMetapopulationDynamicsCanonicalLaneLean.HabitatPatchDynamics

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure SpatiallyExplicitModel (P : PatchNetwork) (O : OccupancyDynamics P) where
  dispersalKernel : P.patches -> P.patches -> Float
  colonizationFromNeighbors : Prop
  extinctionRiskSpatial : Prop
  connectivityDecay : Float

structure SpatiallyExplicitModelEvidence (P : PatchNetwork) (O : OccupancyDynamics P) (S : SpatiallyExplicitModel P O) where
  kernelWellDefined : ∀ i j : Nat, i < P.patches ∧ j < P.patches → S.dispersalKernel i j ≥ 0.0
  colonizationFromNeighborsClosed : S.colonizationFromNeighbors
  extinctionRiskSpatialClosed : S.extinctionRiskSpatial
  connectivityDecayPositive : S.connectivityDecay > 0.0

def SpatiallyExplicitModelClosed (P : PatchNetwork) (O : OccupancyDynamics P) (S : SpatiallyExplicitModel P O) : Prop :=
  (∀ i j : Nat, i < P.patches ∧ j < P.patches → S.dispersalKernel i j ≥ 0.0) ∧
  S.colonizationFromNeighbors ∧
  S.extinctionRiskSpatial ∧
  S.connectivityDecay > 0.0

theorem spatially_explicit_model_closed_from_evidence (P : PatchNetwork) (O : OccupancyDynamics P) (S : SpatiallyExplicitModel P O) (E : SpatiallyExplicitModelEvidence P O S) : SpatiallyExplicitModelClosed P O S := by
  exact And.intro E.kernelWellDefined (And.intro E.colonizationFromNeighborsClosed (And.intro E.extinctionRiskSpatialClosed E.connectivityDecayPositive))

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse