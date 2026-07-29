import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure DiffusionObject where
  space : Type u
  topology : TopologicalSpace space
  heatKernel : space -> space -> ℝ → ℝ
  continuousHeatKernel : Prop
  semigroupProperty : Prop
  conclusion : continuousHeatKernel ∧ semigroupProperty

structure DiffusionAdmittedObject where
  object : DiffusionObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def DiffusionWitnessClosed (O : DiffusionObject) : Prop :=
  O.continuousHeatKernel ∧ O.semigroupProperty

end DiffusionCanonicalLaneLean
end HautevilleHouse