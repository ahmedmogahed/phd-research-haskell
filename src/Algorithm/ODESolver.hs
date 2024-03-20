module Algorithm.ODESolver(solveWithEuler, solveWithRK4) where

import Numeric.LinearAlgebra.Data
import Type.ModelStateFunction
import Type.Solver (ODESolverParams(..))


solveWithEuler :: StateFunction -> ODESolverParams -> StateVector
solveWithEuler stateFnc (ODESolverParams xi u h tm) = foldl (\x tn -> eulerIntegration stateFnc x u tn h) xi [0, h .. tm - h]

solveWithRK4 :: StateFunction -> ODESolverParams -> StateVector
solveWithRK4 stateFnc (ODESolverParams xi u h tm) = foldl (\x tn -> rungeKuttaIntegration stateFnc x u tn h) xi [0, h .. tm - h]



eulerIntegration :: StateFunction -> StateVector -> InputVector -> TimeInstant -> Double  -> StateVector
eulerIntegration stateFnc x u tn h = x + xns
  where
  xns = scalar h * stateFnc x u (h * tn)

rungeKuttaIntegration :: StateFunction -> StateVector -> InputVector -> Double -> Double -> StateVector
rungeKuttaIntegration stateFnc x u tn h = x + xns
  where
  xns = scalar (h / 6.0) * (k1 + scalar 2 * k2 + scalar 2 * k3 + k4)

  k1 = stateFnc x u tn
  k2 = stateFnc (x + scalar (h / 2.0) * k1) u (tn + h / 2.0)
  k3 = stateFnc (x + scalar (h / 2.0) * k2) u (tn + h / 2.0)
  k4 = stateFnc (x + scalar h * k3) u (tn + h)