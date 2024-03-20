module Main (main) where

import Model.SingleTrack (kinematicSingleTrack)
import Numeric.LinearAlgebra
import Algorithm.ODESolver
import Type.Solver (ODESolverParams(..))

main :: IO ()
main = do
  -- let tmax = 4.7
  let solverParams = ODESolverParams {initialStateVector = vector [0.1, 0.2, 0.3], inputVector = vector [0.3,0.1], stepSize = 0.1, tmax = 4.7 }

  print $ solveWithEuler kinematicSingleTrack solverParams
