import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure StochasticDispersalPackage where
  dispersalKernel : landscape → landscape → ℝ
  meanDispersalDistance : ℝ
  longDistanceDispersal : Prop
  dispersalSuccessRate : landscape → ℝ
  kernelNormalization : Prop
  fatTailProperty : Prop

structure StochasticDispersalEvidence (S : StochasticDispersalPackage) where
  kernelNormalizationClosed : S.kernelNormalization
  fatTailPropertyClosed : S.fatTailProperty

def StochasticDispersalClosed (S : StochasticDispersalPackage) : Prop :=
  S.kernelNormalization ∧ S.fatTailProperty

theorem stochastic_dispersal_closed_from_evidence
    (S : StochasticDispersalPackage) (E : StochasticDispersalEvidence S) :
    StochasticDispersalClosed S :=
  And.intro E.kernelNormalizationClosed E.fatTailPropertyClosed

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse