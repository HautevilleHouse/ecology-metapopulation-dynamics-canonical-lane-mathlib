import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure MetapopulationObject where
  patches : Type
  connectivity : Type
  extinctionRisk : Prop
  colonizationRate : Prop
  equilibriumDistribution : Prop

structure AdmissibleClass where
  object : MetapopulationObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse
