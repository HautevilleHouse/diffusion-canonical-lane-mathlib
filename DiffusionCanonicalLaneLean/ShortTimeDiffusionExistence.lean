import DiffusionCanonicalLaneLean.FickEquationPackage

/-!
# Short-Time Diffusion Existence Package
-/

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure ShortTimeDiffusionExistencePackage {G : RiemannianCurvaturePackage}
    (F : FickEquationPackage G) where
  parabolicRegularity : Prop
  localExistenceInterval : Prop
  uniquenessOnOverlap : Prop
  continuationCriterion : Prop

structure ShortTimeDiffusionExistenceEvidence {G : RiemannianCurvaturePackage}
    {F : FickEquationPackage G} (S : ShortTimeDiffusionExistencePackage F) where
  parabolicRegularityClosed : S.parabolicRegularity
  localExistenceIntervalClosed : S.localExistenceInterval
  uniquenessOnOverlapClosed : S.uniquenessOnOverlap
  continuationCriterionClosed : S.continuationCriterion

def ShortTimeDiffusionExistenceClosed {G : RiemannianCurvaturePackage}
    {F : FickEquationPackage G} (S : ShortTimeDiffusionExistencePackage F) : Prop :=
  S.parabolicRegularity ∧ S.localExistenceInterval ∧ S.uniquenessOnOverlap ∧ S.continuationCriterion

theorem short_time_diffusion_existence_closed_from_evidence
    {G : RiemannianCurvaturePackage} {F : FickEquationPackage G}
    (S : ShortTimeDiffusionExistencePackage F) (E : ShortTimeDiffusionExistenceEvidence S) :
    ShortTimeDiffusionExistenceClosed S := by
  exact And.intro E.parabolicRegularityClosed
    (And.intro E.localExistenceIntervalClosed
      (And.intro E.uniquenessOnOverlapClosed E.continuationCriterionClosed))

end DiffusionCanonicalLaneLean
end HautevilleHouse