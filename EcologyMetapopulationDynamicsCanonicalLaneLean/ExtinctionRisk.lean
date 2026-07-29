import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure ExtinctionRiskPackage where
  extinctionProbabilities : landscape → ℝ
  demographicStochasticity : Prop
  environmentalCatastrophe : Prop
  rescueEffect : Prop
  minimumViablePopulation : ℝ

structure ExtinctionRiskEvidence (E : ExtinctionRiskPackage) where
  demographicStochasticityClosed : E.demographicStochasticity
  environmentalCatastropheClosed : E.environmentalCatastrophe
  rescueEffectClosed : E.rescueEffect

def ExtinctionRiskClosed (E : ExtinctionRiskPackage) : Prop :=
  E.demographicStochasticity ∧ E.environmentalCatastrophe ∧ E.rescueEffect

theorem extinction_risk_closed_from_evidence
    (E : ExtinctionRiskPackage) (Ev : ExtinctionRiskEvidence E) :
    ExtinctionRiskClosed E :=
  And.intro Ev.demographicStochasticityClosed
    (And.intro Ev.environmentalCatastropheClosed Ev.rescueEffectClosed)

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse