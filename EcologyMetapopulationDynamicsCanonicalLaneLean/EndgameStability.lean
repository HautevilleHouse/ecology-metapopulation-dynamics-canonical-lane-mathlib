import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure EndgameStabilityPackage where
  equilibriumState : landscape → ℝ
  localStability : Prop
  globalStability : Prop
  resilienceMeasure : ℝ
  persistenceCondition : ∀ patch, patches patch → equilibriumState patch > 0
  stabilityConclusion : localStability ∧ globalStability

structure EndgameStabilityEvidence (E : EndgameStabilityPackage) where
  localStabilityClosed : E.localStability
  globalStabilityClosed : E.globalStability
  persistenceConditionClosed : E.persistenceCondition

def EndgameStabilityClosed (E : EndgameStabilityPackage) : Prop :=
  E.localStability ∧ E.globalStability ∧ E.persistenceCondition

theorem endgame_stability_closed_from_evidence
    (E : EndgameStabilityPackage) (Ev : EndgameStabilityEvidence E) :
    EndgameStabilityClosed E :=
  And.intro Ev.localStabilityClosed
    (And.intro Ev.globalStabilityClosed Ev.persistenceConditionClosed)

theorem endgame_stability_supports_persistence
    (E : EndgameStabilityPackage) : ∀ patch, patches patch → E.equilibriumState patch > 0 :=
  E.persistenceCondition

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse