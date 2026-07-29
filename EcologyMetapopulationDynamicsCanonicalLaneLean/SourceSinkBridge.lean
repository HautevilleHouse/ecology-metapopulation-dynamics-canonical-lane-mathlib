import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure SourceSinkPackage where
  sourceGrowthRate : Float
  sinkGrowthRate : Float
  dispersalRate : Float
  sourceCarryingCapacity : Nat
  prop

structure SourceSinkEvidence (S : SourceSinkPackage) where
  sourceGrowthPositive : S.sourceGrowthRate > 0.0
  sinkGrowthNegative : S.sinkGrowthRate < 0.0
  dispersalNonnegative : S.dispersalRate >= 0.0

def SourceSinkClosed (S : SourceSinkPackage) : Prop :=
  S.sourceGrowthRate > 0.0 ∧
  S.sinkGrowthRate < 0.0 ∧
  S.dispersalRate >= 0.0

theorem source_sink_closed_from_evidence (S : SourceSinkPackage) (E : SourceSinkEvidence S) : SourceSinkClosed S := by
  exact And.intro E.sourceGrowthPositive (And.intro E.sinkGrowthNegative E.dispersalNonnegative)

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse
