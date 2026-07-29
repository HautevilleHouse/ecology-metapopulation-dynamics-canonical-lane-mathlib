import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure MetapopulationSpace where
  patchSet : Type
  topology : TopologicalSpace patchSet

structure MetapopulationAdmittedObject where
  space : MetapopulationSpace
  patchOccupancyDynamic : Prop
  extinctionColonizationStable : Prop
  persistenceCondition : Prop
  conclusion : persistenceCondition

def MetapopulationWitnessClosed (O : MetapopulationAdmittedObject) : Prop :=
  O.persistenceCondition

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse
