import DiffusionCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DiffusionWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiffusionCanonicalLaneLean
end HautevilleHouse