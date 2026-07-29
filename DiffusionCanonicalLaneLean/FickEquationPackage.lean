import DiffusionCanonicalLaneLean.RiemannianCurvature

/-!
# Fick Equation Package
-/

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure FickEquationPackage (G : RiemannianCurvaturePackage) where
  timeParameter : Type u
  concentrationField : Type v
  fluxLaw : Prop
  continuityEquation : Prop
  diffusionTensor : Prop
  initiallyMatched : Prop
  boundaryCondition : Prop

structure FickEquationEvidence {G : RiemannianCurvaturePackage} (F : FickEquationPackage G) where
  fluxLawClosed : F.fluxLaw
  continuityEquationClosed : F.continuityEquation
  diffusionTensorClosed : F.diffusionTensor
  initiallyMatchedClosed : F.initiallyMatched
  boundaryConditionClosed : F.boundaryCondition

def FickEquationClosed {G : RiemannianCurvaturePackage} (F : FickEquationPackage G) : Prop :=
  F.fluxLaw ∧ F.continuityEquation ∧ F.diffusionTensor ∧ F.initiallyMatched ∧ F.boundaryCondition

theorem fick_equation_closed_from_evidence {G : RiemannianCurvaturePackage}
    (F : FickEquationPackage G) (E : FickEquationEvidence F) : FickEquationClosed F := by
  exact And.intro E.fluxLawClosed
    (And.intro E.continuityEquationClosed
      (And.intro E.diffusionTensorClosed
        (And.intro E.initiallyMatchedClosed E.boundaryConditionClosed)))

end DiffusionCanonicalLaneLean
end HautevilleHouse