import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure BrownianMotionPackage where
  stateSpace : Type u
  topology : TopologicalSpace stateSpace
  timeDomain : Type v
  filtration : Type w
  paths : stateSpace -> timeDomain -> stateSpace
  continuousPaths : Prop
  markovProperty : Prop
  scalingLimit : Prop

def BrownianMotionClosed (B : BrownianMotionPackage) : Prop :=
  B.continuousPaths ∧ B.markovProperty ∧ B.scalingLimit

end DiffusionCanonicalLaneLean
end HautevilleHouse