import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure LandscapeConnectivityPackage where
  landscape : Type u
  topology : TopologicalSpace landscape
  patchDistribution : landscape → Prop
  connectivityMatrix : landscape → landscape → Prop
  isolationCondition : ∀ x, patches x → (∃ y, connectivity y x)
  fragmentationCondition : Prop

structure LandscapeConnectivityEvidence (L : LandscapeConnectivityPackage) where
  isolationConditionClosed : L.isolationCondition
  fragmentationConditionClosed : L.fragmentationCondition

def LandscapeConnectivityClosed (L : LandscapeConnectivityPackage) : Prop :=
  L.isolationCondition ∧ L.fragmentationCondition

theorem landscape_connectivity_closed_from_evidence
    (L : LandscapeConnectivityPackage) (E : LandscapeConnectivityEvidence L) :
    LandscapeConnectivityClosed L :=
  And.intro E.isolationConditionClosed E.fragmentationConditionClosed

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse