import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusionCanonicalLaneLean

structure HeatEquationPackage where
  temperatureField : Type u
  thermalDiffusivity : Prop
  laplacianOperator : Prop
  timeDerivativeRelation : Prop
  initialBoundaryConditions : Prop

structure HeatEquationEvidence (H : HeatEquationPackage) where
  thermalDiffusivityClosed : H.thermalDiffusivity
  laplacianOperatorClosed : H.laplacianOperator
  timeDerivativeRelationClosed : H.timeDerivativeRelation
  initialBoundaryConditionsClosed : H.initialBoundaryConditions

def HeatEquationClosed (H : HeatEquationPackage) : Prop :=
  H.thermalDiffusivity ∧ H.laplacianOperator ∧
  H.timeDerivativeRelation ∧ H.initialBoundaryConditions

theorem heat_equation_closed_from_evidence (H : HeatEquationPackage)
    (E : HeatEquationEvidence H) : HeatEquationClosed H := by
  exact And.intro E.thermalDiffusivityClosed
    (And.intro E.laplacianOperatorClosed
      (And.intro E.timeDerivativeRelationClosed E.initialBoundaryConditionsClosed))

end DiffusionCanonicalLaneLean
end HautevilleHouse