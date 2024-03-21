module Type.Solver (ODESolverParams(..), SolverFunction) where

import Numeric.LinearAlgebra (Vector)
import Type.ModelStateFunction

data ODESolverParams = ODESolverParams {initialStateVector :: Vector Double, inputVector :: Vector Double, stepSize :: Double, tmax :: Double }

type SolverFunction = (StateFunction -> StateVector -> InputVector -> TimeInstant -> Double -> StateVector)