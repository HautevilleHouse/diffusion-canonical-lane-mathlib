import DiffusionCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DiffusionCanonicalLaneLean
end HautevilleHouse