import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure DiffusionEquationPackage where
  spatialDomain : Type u
  timeDomain : Type v
  concentrationField : Type w
  diffusionCoefficient : Prop
  fluxLaw : Prop
  continuityEquation : Prop

structure DiffusionEquationEvidence (D : DiffusionEquationPackage) where
  diffusionCoefficientClosed : D.diffusionCoefficient
  fluxLawClosed : D.fluxLaw
  continuityEquationClosed : D.continuityEquation

def DiffusionEquationClosed (D : DiffusionEquationPackage) : Prop :=
  D.diffusionCoefficient ∧ D.fluxLaw ∧ D.continuityEquation

theorem diffusion_equation_closed_from_evidence (D : DiffusionEquationPackage)
    (E : DiffusionEquationEvidence D) : DiffusionEquationClosed D := by
  exact And.intro E.diffusionCoefficientClosed
    (And.intro E.fluxLawClosed E.continuityEquationClosed)

end DiffusionCanonicalLaneLean
end HautevilleHouse