import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure FokkerPlanckPackage where
  probabilityDensity : Type u
  driftField : Type v
  diffusionTensor : Type w
  conservativeDrift : Prop
  nonnegativeDiffusion : Prop
  fokkerPlanckEquation : Prop

structure FokkerPlanckEvidence (F : FokkerPlanckPackage) where
  conservativeDriftClosed : F.conservativeDrift
  nonnegativeDiffusionClosed : F.nonnegativeDiffusion
  fokkerPlanckEquationClosed : F.fokkerPlanckEquation

def FokkerPlanckClosed (F : FokkerPlanckPackage) : Prop :=
  F.conservativeDrift ∧ F.nonnegativeDiffusion ∧ F.fokkerPlanckEquation

theorem fokker_planck_closed_from_evidence (F : FokkerPlanckPackage) (E : FokkerPlanckEvidence F) :
    FokkerPlanckClosed F := by
  exact And.intro E.conservativeDriftClosed
    (And.intro E.nonnegativeDiffusionClosed E.fokkerPlanckEquationClosed)

end DiffusionCanonicalLaneLean
end HautevilleHouse
