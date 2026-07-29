import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure PatchNetwork where
  patches : Type u
  dispersalMatrix : patches → patches → ℝ
  habitatQuality : patches → ℝ
  connectivity : patches → ℝ
  patchCount : Nat
  connected : Prop

structure PatchNetworkAdmissible (P : PatchNetwork) where
  patchesNonempty : Nonempty P.patches
  patchCountPositive : P.patchCount > 0
  connectivityPositive : ∀ p : P.patches, P.connectivity p > 0
  networkConnected : P.connected

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse