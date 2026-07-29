import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure LevinsModelPackage where
  colonizationRate : Float
  extinctionRate : Float
  equilibriumOccupancy : Float
  prop

structure LevinsModelEvidence (L : LevinsModelPackage) where
  equilibriumFormula : L.equilibriumOccupancy = 1.0 - (L.extinctionRate / L.colonizationRate)
  colonizationRatePositive : L.colonizationRate > 0.0
  equilibriumNonnegative : L.equilibriumOccupancy >= 0.0

def LevinsModelClosed (L : LevinsModelPackage) : Prop :=
  L.equilibriumOccupancy = 1.0 - (L.extinctionRate / L.colonizationRate) ∧
  L.colonizationRate > 0.0 ∧
  L.equilibriumOccupancy >= 0.0

theorem levins_model_closed_from_evidence (L : LevinsModelPackage) (E : LevinsModelEvidence L) : LevinsModelClosed L := by
  exact And.intro E.equilibriumFormula (And.intro E.colonizationRatePositive E.equilibriumNonnegative)

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse
