import canonicallaneMathlib.AdmissibleClass
import EcologyMetapopulationDynamicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EcologyMetapopulationDynamicsCanonicalLaneLean

structure MetapopulationConnectivityPackage where
  dispersalKernel : Prop
  connectivityMatrix : Prop
  distanceDecay : Prop
  matrixSymmetry : Prop

structure MetapopulationConnectivityEvidence (C : MetapopulationConnectivityPackage) where
  dispersalKernelClosed : C.dispersalKernel
  connectivityMatrixClosed : C.connectivityMatrix
  distanceDecayClosed : C.distanceDecay
  matrixSymmetryClosed : C.matrixSymmetry

def MetapopulationConnectivityClosed (C : MetapopulationConnectivityPackage) : Prop :=
  C.dispersalKernel ∧ C.connectivityMatrix ∧
  C.distanceDecay ∧ C.matrixSymmetry

theorem metapopulation_connectivity_closed_from_evidence
    (C : MetapopulationConnectivityPackage) (E : MetapopulationConnectivityEvidence C) :
    MetapopulationConnectivityClosed C := by
  exact And.intro E.dispersalKernelClosed
    (And.intro E.connectivityMatrixClosed
      (And.intro E.distanceDecayClosed E.matrixSymmetryClosed))

end EcologyMetapopulationDynamicsCanonicalLaneLean
end HautevilleHouse
