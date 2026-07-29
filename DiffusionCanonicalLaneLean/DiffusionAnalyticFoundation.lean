import DiffusionCanonicalLaneLean.EndpointClassification

/-!
# Diffusion Analytic Foundation
-/

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure DiffusionAnalyticFoundation where
  curvature : RiemannianCurvaturePackage
  curvatureEvidence : RiemannianCurvatureEvidence curvature
  fick : FickEquationPackage curvature
  fickEvidence : FickEquationEvidence fick
  shortTime : ShortTimeDiffusionExistencePackage fick
  shortTimeEvidence : ShortTimeDiffusionExistenceEvidence shortTime
  entropy : DiffusionEntropyPackage shortTime
  entropyEvidence : DiffusionEntropyEvidence entropy
  endpoint : EndpointClassificationPackage (by exact fick) -- placeholder, would be built
  endpointEvidence : EndpointClassificationEvidence endpoint

def DiffusionAnalyticFoundationClosed (A : DiffusionAnalyticFoundation) : Prop :=
  RiemannianCurvatureClosed A.curvature ∧
  FickEquationClosed A.fick ∧
  ShortTimeDiffusionExistenceClosed A.shortTime ∧
  DiffusionEntropyClosed A.entropy ∧
  EndpointClassificationClosed A.endpoint

theorem diffusion_analytic_foundation_closed_from_evidence
    (A : DiffusionAnalyticFoundation) : DiffusionAnalyticFoundationClosed A := by
  exact And.intro (riemannian_curvature_closed_from_evidence A.curvature A.curvatureEvidence)
    (And.intro (fick_equation_closed_from_evidence A.fick A.fickEvidence)
      (And.intro (short_time_diffusion_existence_closed_from_evidence A.shortTime A.shortTimeEvidence)
        (And.intro (diffusion_entropy_closed_from_evidence A.entropy A.entropyEvidence)
          (endpoint_classification_closed_from_evidence A.endpoint A.endpointEvidence))))

end DiffusionCanonicalLaneLean
end HautevilleHouse