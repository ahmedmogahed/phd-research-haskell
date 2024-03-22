module Main (main) where

import Model.SingleTrack (kinematicSingleTrack)
import Numeric.LinearAlgebra
import Algorithm.ODESolver
import Type.Solver (ODESolverParams(..))
import Algorithm.Interpolation


main :: IO ()
main = do
  let solverParams = ODESolverParams {
                        initialStateVector = vector [0.1, 0.2, 0.3, 0.4], 
                        inputVector = vector [0.3,0.1], 
                        stepSize = 0.1, 
                        tmax = 1.0
                      }
  let h = stepSize solverParams
  let tm = tmax solverParams
  let result = solveWithEulerList solverParams kinematicSingleTrack
  print result
  print $ linearInterpolation (vector [0, h .. tm]) result (1.2)