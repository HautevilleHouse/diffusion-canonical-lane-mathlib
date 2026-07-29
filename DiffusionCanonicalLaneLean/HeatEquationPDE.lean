import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure HeatEquationPackage where
  temperatureField : Type u
  spatialDomain : Type v
  timeDomain : Type w
  thermalDiffusivity : Prop
  heatEquation : Prop
  initialCondition : Prop
  boundaryCondition : Prop

structure HeatEquationEvidence (H : HeatEquationPackage) where
  thermalDiffusivityClosed : H.thermalDiffusivity
  heatEquationClosed : H.heatEquation
  initialConditionClosed : H.initialCondition
  boundaryConditionClosed : H.boundaryCondition

def HeatEquationClosed (H : HeatEquationPackage) : Prop :=
  H.thermalDiffusivity ∧ H.heatEquation ∧ H.initialCondition ∧ H.boundaryCondition

theorem heat_equation_closed_from_evidence (H : HeatEquationPackage) (E : HeatEquationEvidence H) :
    HeatEquationClosed H := by
  exact And.intro E.thermalDiffusivityClosed
    (And.intro E.heatEquationClosed
      (And.intro E.initialConditionClosed E.boundaryConditionClosed))

end DiffusionCanonicalLaneLean
end HautevilleHouse
