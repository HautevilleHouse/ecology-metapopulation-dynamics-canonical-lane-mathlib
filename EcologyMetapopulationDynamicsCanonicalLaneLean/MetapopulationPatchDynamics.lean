import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure MetapopulationPatchDynamicsPackage where
  patchArea : Nat -> Float
  colonizationRate : Nat -> Nat -> Float
  extinctionRate : Nat -> Float
  carryingCapacity : Nat -> Nat
  connectivityMatrix : Nat -> Nat -> Float
  prop

structure MetapopulationPatchDynamicsEvidence (M : MetapopulationPatchDynamicsPackage) where
  patchAreaDefined : M.patchArea 0 = 1.0
  colonizationRateSymmetric : forall i j, M.colonizationRate i j = M.colonizationRate j i
  extinctionRatePositive : forall i, M.extinctionRate i > 0.0

structure MetapopulationPatchDynamicsClosed (M : MetapopulationPatchDynamicsPackage) : Prop where
  patchAreaDefined : M.patchArea 0 = 1.0
  colonizationRateSymmetric : forall i j, M.colonizationRate i j = M.colonizationRate j i
  extinctionRatePositive : forall i, M.extinctionRate i > 0.0

theorem metapopulation_patch_dynamics_closed_from_evidence
    (M : MetapopulationPatchDynamicsPackage)
    (E : MetapopulationPatchDynamicsEvidence M) : MetapopulationPatchDynamicsClosed M := by
  exact { patchAreaDefined := E.patchAreaDefined,
          colonizationRateSymmetric := E.colonizationRateSymmetric,
          extinctionRatePositive := E.extinctionRatePositive }

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse
