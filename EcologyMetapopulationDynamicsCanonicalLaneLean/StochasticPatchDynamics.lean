import canonicalLaneMathlib.AdmissibleClass
import EcologyMetapopulationDynamicsCanonicalLaneLean.HabitatPatchDynamics

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure StochasticPatchModel (P : PatchNetwork) (O : OccupancyDynamics P) where
  extinctionEvents : Type u
  colonizationEvents : Type v
  eventRates : Type w
  masterEquation : Prop

structure StochasticPatchModelEvidence (P : PatchNetwork) (O : OccupancyDynamics P) (S : StochasticPatchModel P O) where
  extinctionEventsWellDefined : Nonempty S.extinctionEvents
  colonizationEventsWellDefined : Nonempty S.colonizationEvents
  eventRatesPositive : Nonempty S.eventRates
  masterEquationClosed : S.masterEquation

def StochasticPatchModelClosed (P : PatchNetwork) (O : OccupancyDynamics P) (S : StochasticPatchModel P O) : Prop :=
  Nonempty S.extinctionEvents ∧
  Nonempty S.colonizationEvents ∧
  Nonempty S.eventRates ∧
  S.masterEquation

theorem stochastic_patch_model_closed_from_evidence (P : PatchNetwork) (O : OccupancyDynamics P) (S : StochasticPatchModel P O) (E : StochasticPatchModelEvidence P O S) : StochasticPatchModelClosed P O S := by
  exact And.intro E.extinctionEventsWellDefined (And.intro E.colonizationEventsWellDefined (And.intro E.eventRatesPositive E.masterEquationClosed))

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse