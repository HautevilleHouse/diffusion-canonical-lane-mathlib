import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure ForwardEquationPackage {D : DiffusionKernelPackage} (K : D) where
  infinitesimalGenerator : Type u
  kolmogorovForwardEquation : Prop
  parabolicRegularity : Prop
  uniquenessClass : Prop

structure ForwardEquationEvidence {D : DiffusionKernelPackage} {K : DiffusionKernelPackage}
    (F : ForwardEquationPackage K) where
  kolmogorovForwardEquationClosed : F.kolmogorovForwardEquation
  parabolicRegularityClosed : F.parabolicRegularity
  uniquenessClassClosed : F.uniquenessClass

def ForwardEquationClosed {D : DiffusionKernelPackage} {K : DiffusionKernelPackage}
    (F : ForwardEquationPackage K) : Prop :=
  F.kolmogorovForwardEquation ∧ F.parabolicRegularity ∧ F.uniquenessClass

theorem forward_equation_closed_from_evidence
    {D : DiffusionKernelPackage} {K : DiffusionKernelPackage}
    (F : ForwardEquationPackage K) (E : ForwardEquationEvidence F) :
    ForwardEquationClosed F := by
  exact And.intro E.kolmogorovForwardEquationClosed
    (And.intro E.parabolicRegularityClosed E.uniquenessClassClosed)

end DiffusionCanonicalLaneLean
end HautevilleHouse