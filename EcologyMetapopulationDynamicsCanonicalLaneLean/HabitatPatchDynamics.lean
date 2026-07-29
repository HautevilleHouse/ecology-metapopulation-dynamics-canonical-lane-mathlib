import canonicallaneMathlib.AdmissibleClass
import EcologyMetapopulationDynamicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure HabitatPatchDynamicsPackage where
  patchAreaDistribution : Prop
  extinctionThreshold : Prop
  colonizationProbability : Prop
  localDynamics : Prop

structure HabitatPatchDynamicsEvidence (P : HabitatPatchDynamicsPackage) where
  patchAreaDistributionClosed : P.patchAreaDistribution
  extinctionThresholdClosed : P.extinctionThreshold
  colonizationProbabilityClosed : P.colonizationProbability
  localDynamicsClosed : P.localDynamics

def HabitatPatchDynamicsClosed (P : HabitatPatchDynamicsPackage) : Prop :=
  P.patchAreaDistribution ∧ P.extinctionThreshold ∧
  P.colonizationProbability ∧ P.localDynamics

theorem habitat_patch_dynamics_closed_from_evidence
    (P : HabitatPatchDynamicsPackage) (E : HabitatPatchDynamicsEvidence P) :
    HabitatPatchDynamicsClosed P := by
  exact And.intro E.patchAreaDistributionClosed
    (And.intro E.extinctionThresholdClosed
      (And.intro E.colonizationProbabilityClosed E.localDynamicsClosed))

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse
