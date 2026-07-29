import DiffusionCanonicalLaneLean.ShortTimeDiffusionExistence

/-!
# Diffusion Entropy Package
-/

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure DiffusionEntropyPackage {G : RiemannianCurvaturePackage}
    {F : FickEquationPackage G} (S : ShortTimeDiffusionExistencePackage F) where
  relativeEntropy : Type u
  entropyProduction : Prop
  monotonicityFormula : Prop
  hTheorem : Prop

structure DiffusionEntropyEvidence {G : RiemannianCurvaturePackage}
    {F : FickEquationPackage G} {S : ShortTimeDiffusionExistencePackage F}
    (E : DiffusionEntropyPackage S) where
  entropyProductionClosed : E.entropyProduction
  monotonicityFormulaClosed : E.monotonicityFormula
  hTheoremClosed : E.hTheorem

def DiffusionEntropyClosed {G : RiemannianCurvaturePackage}
    {F : FickEquationPackage G} {S : ShortTimeDiffusionExistencePackage F}
    (E : DiffusionEntropyPackage S) : Prop :=
  E.entropyProduction ∧ E.monotonicityFormula ∧ E.hTheorem

theorem diffusion_entropy_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : FickEquationPackage G}
    {S : ShortTimeDiffusionExistencePackage F} (E : DiffusionEntropyPackage S)
    (Ev : DiffusionEntropyEvidence E) : DiffusionEntropyClosed E := by
  exact And.intro Ev.entropyProductionClosed
    (And.intro Ev.monotonicityFormulaClosed Ev.hTheoremClosed)

end DiffusionCanonicalLaneLean
end HautevilleHouse