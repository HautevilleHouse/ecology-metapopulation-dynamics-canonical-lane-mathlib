import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure ColonizationDynamicsPackage where
  colonizationRate : ℝ → ℝ
  extinctionRate : ℝ → ℝ
  carryingCapacity : ℝ
  equilibriumOccupancy : ℝ
  deterministicEquation : Prop
  stochasticFluctuation : Prop

structure ColonizationDynamicsEvidence (C : ColonizationDynamicsPackage) where
  deterministicEquationClosed : C.deterministicEquation
  stochasticFluctuationClosed : C.stochasticFluctuation

def ColonizationDynamicsClosed (C : ColonizationDynamicsPackage) : Prop :=
  C.deterministicEquation ∧ C.stochasticFluctuation

theorem colonization_dynamics_closed_from_evidence
    (C : ColonizationDynamicsPackage) (E : ColonizationDynamicsEvidence C) :
    ColonizationDynamicsClosed C :=
  And.intro E.deterministicEquationClosed E.stochasticFluctuationClosed

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse