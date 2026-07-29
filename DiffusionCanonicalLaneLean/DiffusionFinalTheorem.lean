import DiffusionCanonicalLaneLean.DiffusionBridgeLemmas
import DiffusionCanonicalLaneLean.DiffusionGateLemmas

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

def ConstrainedDiffusionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_diffusion_endgame (A : AdmissibleClass) :
    ConstrainedDiffusionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiffusionCanonicalLaneLean
end HautevilleHouse
