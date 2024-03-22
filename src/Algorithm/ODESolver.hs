module Algorithm.ODESolver (solveWithEuler, solveWithEulerList, solveWithRK4, solveWithRK4List) where

import Numeric.LinearAlgebra.Data
import Type.ModelStateFunction
import Type.Solver (ODESolverParams(..), SolverFunction)

-- interface
solveWithEuler :: ODESolverParams -> StateFunction -> StateVector
solveWithEuler = solveWithMethod eulerMethod

solveWithRK4 :: ODESolverParams -> StateFunction -> StateVector
solveWithRK4 = solveWithMethod rungeKutta4Method

solveWithEulerList :: ODESolverParams -> StateFunction -> Matrix Double
solveWithEulerList = solveWithMethodList eulerMethod

solveWithRK4List :: ODESolverParams -> StateFunction -> Matrix Double
solveWithRK4List = solveWithMethodList rungeKutta4Method

-- intermediate interface
solveWithMethod :: SolverFunction -> ODESolverParams -> StateFunction -> StateVector
solveWithMethod solverMethod (ODESolverParams xi u h tm) stateFnc = foldl (\x tn -> solverMethod stateFnc x u tn h) xi [0, h .. tm - h]

solveWithMethodList :: SolverFunction -> ODESolverParams -> StateFunction -> Matrix Double
solveWithMethodList solverMethod (ODESolverParams xi u h tm) stateFnc = foldl solverFoldingFnc (asRow xi) [0, h .. tm - h]
  where
  solverFoldingFnc x tn = x === asRow (solverMethod stateFnc (lastRow x) u tn h)
  lastRow m = flatten (m ?? (TakeLast 1, All))

-- Solver methods 
-- Euler method (https://en.wikipedia.org/wiki/Euler_method)
eulerMethod :: SolverFunction
eulerMethod stateFnc x u tn h = x + xns
  where
  xns = scalar h * stateFnc x u (h * tn)

-- Runge Kutta 4th order (https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods)
rungeKutta4Method :: SolverFunction
rungeKutta4Method stateFnc x u tn h = x + xns
  where
  xns = scalar (h / 6.0) * (k1 + scalar 2 * k2 + scalar 2 * k3 + k4)

  k1 = stateFnc x u tn
  k2 = stateFnc (x + scalar (h / 2.0) * k1) u (tn + h / 2.0)
  k3 = stateFnc (x + scalar (h / 2.0) * k2) u (tn + h / 2.0)
  k4 = stateFnc (x + scalar h * k3) u (tn + h)
