import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure HeatKernelPackage where
  kernelFunction : Type u
  fundamentalSolution : Prop
  smoothingProperty : Prop
  asymptoticExpansion : Prop

structure HeatKernelEvidence (K : HeatKernelPackage) where
  fundamentalSolutionClosed : K.fundamentalSolution
  smoothingPropertyClosed : K.smoothingProperty
  asymptoticExpansionClosed : K.asymptoticExpansion

def HeatKernelClosed (K : HeatKernelPackage) : Prop :=
  K.fundamentalSolution ∧ K.smoothingProperty ∧ K.asymptoticExpansion

theorem heat_kernel_closed_from_evidence (K : HeatKernelPackage) (E : HeatKernelEvidence K) :
    HeatKernelClosed K := by
  exact And.intro E.fundamentalSolutionClosed (And.intro E.smoothingPropertyClosed E.asymptoticExpansionClosed)

end DiffusionCanonicalLaneLean
end HautevilleHouse