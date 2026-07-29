import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure FickLawPackage where
  concentrationGradient : Prop
  diffusiveFluxField : Prop
  diffusivityTensor : Prop
  negativeGradientRelation : Prop

structure FickLawEvidence (F : FickLawPackage) where
  concentrationGradientClosed : F.concentrationGradient
  diffusiveFluxFieldClosed : F.diffusiveFluxField
  diffusivityTensorClosed : F.diffusivityTensor
  negativeGradientRelationClosed : F.negativeGradientRelation

def FickLawClosed (F : FickLawPackage) : Prop :=
  F.concentrationGradient ∧ F.diffusiveFluxField ∧
  F.diffusivityTensor ∧ F.negativeGradientRelation

theorem fick_law_closed_from_evidence (F : FickLawPackage)
    (E : FickLawEvidence F) : FickLawClosed F := by
  exact And.intro E.concentrationGradientClosed
    (And.intro E.diffusiveFluxFieldClosed
      (And.intro E.diffusivityTensorClosed E.negativeGradientRelationClosed))

end DiffusionCanonicalLaneLean
end HautevilleHouse