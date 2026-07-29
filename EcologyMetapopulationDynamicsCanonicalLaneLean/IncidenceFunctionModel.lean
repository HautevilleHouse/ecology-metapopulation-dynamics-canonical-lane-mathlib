import canonicalLaneMathlib.AdmissibleClass
import EcologyMetapopulationDynamicsCanonicalLaneLean.HabitatPatchDynamics

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure IncidenceFunctionModel (P : PatchNetwork) (O : OccupancyDynamics P) where
  connectivityMeasure : Float
  colonizationProbability : Float
  extinctionProbability : Float
  incidenceSteadyState : Prop

structure IncidenceFunctionModelEvidence (P : PatchNetwork) (O : OccupancyDynamics P) (I : IncidenceFunctionModel P O) where
  connectivityComputed : I.connectivityMeasure > 0.0
  colonizationProbInRange : 0.0 ≤ I.colonizationProbability ∧ I.colonizationProbability ≤ 1.0
  extinctionProbInRange : 0.0 ≤ I.extinctionProbability ∧ I.extinctionProbability ≤ 1.0
  incidenceSteadyStateClosed : I.incidenceSteadyState

def IncidenceFunctionModelClosed (P : PatchNetwork) (O : OccupancyDynamics P) (I : IncidenceFunctionModel P O) : Prop :=
  I.connectivityMeasure > 0.0 ∧
  (0.0 ≤ I.colonizationProbability ∧ I.colonizationProbability ≤ 1.0) ∧
  (0.0 ≤ I.extinctionProbability ∧ I.extinctionProbability ≤ 1.0) ∧
  I.incidenceSteadyState

theorem incidence_function_model_closed_from_evidence (P : PatchNetwork) (O : OccupancyDynamics P) (I : IncidenceFunctionModel P O) (E : IncidenceFunctionModelEvidence P O I) : IncidenceFunctionModelClosed P O I := by
  exact And.intro E.connectivityComputed (And.intro E.colonizationProbInRange (And.intro E.extinctionProbInRange E.incidenceSteadyStateClosed))

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse