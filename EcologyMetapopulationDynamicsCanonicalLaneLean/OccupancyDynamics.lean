import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EcologyMetapopulationDynamicsCanonicalLaneLean.MetapopulationPatchNetwork

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure OccupancyVector (P : PatchNetwork) where
  occupied : P.patches → Bool
  occupancyProportion : ℝ

structure OccupancyDynamic (P : PatchNetwork) where
  current : OccupancyVector P
  colonizationRate : ℝ
  extinctionRate : ℝ
  colonizationFunction : OccupancyVector P → ℝ
  extinctionFunction : OccupancyVector P → ℝ

structure OccupancyClosure (P : PatchNetwork) where
  occupancyFineScale : Bool
  colonizationExtinctionBalance : Prop

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse