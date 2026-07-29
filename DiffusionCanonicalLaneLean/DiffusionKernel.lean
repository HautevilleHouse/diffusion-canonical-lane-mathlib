import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure DiffusionKernelPackage where
  stateSpace : Type u
  baseMeasure : Type v
  transitionDensity : Type w
  markovProperty : Prop
  fellerProperty : Prop
  invariantMeasure : Prop
  ergodicity : Prop

structure DiffusionKernelEvidence (D : DiffusionKernelPackage) where
  markovPropertyClosed : D.markovProperty
  fellerPropertyClosed : D.fellerProperty
  invariantMeasureClosed : D.invariantMeasure
  ergodicityClosed : D.ergodicity

def DiffusionKernelClosed (D : DiffusionKernelPackage) : Prop :=
  D.markovProperty ∧ D.fellerProperty ∧ D.invariantMeasure ∧ D.ergodicity

theorem diffusion_kernel_closed_from_evidence (D : DiffusionKernelPackage)
    (E : DiffusionKernelEvidence D) : DiffusionKernelClosed D := by
  exact And.intro E.markovPropertyClosed
    (And.intro E.fellerPropertyClosed
      (And.intro E.invariantMeasureClosed E.ergodicityClosed))

end DiffusionCanonicalLaneLean
end HautevilleHouse