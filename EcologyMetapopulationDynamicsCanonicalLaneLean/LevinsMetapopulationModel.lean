import canonicalLaneMathlib.AdmissibleClass
import EcologyMetapopulationDynamicsCanonicalLaneLean.HabitatPatchDynamics

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure LevinsModel (P : PatchNetwork) (O : OccupancyDynamics P) where
  patchOccupancyDifferentialEquation : Prop
  equilibriumOccupancy : Prop
  colonizationRateUsed : Float
  extinctionRateUsed : Float

def equilibriumOccupancyFormula (c e : Float) : Float :=
  1.0 - e / c

theorem equilibrium_positive_if_colonization_greater (c e : Float) (h : c > e) (hpos : c > 0) : equilibriumOccupancyFormula c e > 0.0 := by
  dsimp [equilibriumOccupancyFormula]
  apply sub_pos.mpr
  have : e / c < 1 := div_lt_one (by linarith)
  linarith

theorem equilibrium_less_than_one (c e : Float) (h : e > 0) : equilibriumOccupancyFormula c e < 1.0 := by
  dsimp [equilibriumOccupancyFormula]
  apply sub_lt_iff_lt_add.mpr
  have : e / c > 0 := div_pos h (by positivity)
  nlinarith

structure LevinsModelEvidence (P : PatchNetwork) (O : OccupancyDynamics P) (L : LevinsModel P O) where
  differentialEquationClosed : L.patchOccupancyDifferentialEquation
  equilibriumClosed : L.equilibriumOccupancy
  colonizationRatePositive : L.colonizationRateUsed > 0.0
  extinctionRatePositive : L.extinctionRateUsed > 0.0

def LevinsModelClosed (P : PatchNetwork) (O : OccupancyDynamics P) (L : LevinsModel P O) : Prop :=
  L.patchOccupancyDifferentialEquation ∧
  L.equilibriumOccupancy ∧
  L.colonizationRateUsed > 0.0 ∧
  L.extinctionRateUsed > 0.0

theorem levins_model_closed_from_evidence (P : PatchNetwork) (O : OccupancyDynamics P) (L : LevinsModel P O) (E : LevinsModelEvidence P O L) : LevinsModelClosed P O L := by
  exact And.intro E.differentialEquationClosed (And.intro E.equilibriumClosed (And.intro E.colonizationRatePositive E.extinctionRatePositive))

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse