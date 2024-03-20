module Type.Solver (ODESolverParams(..)) where

import Numeric.LinearAlgebra (Vector)

data ODESolverParams = ODESolverParams {initialStateVector :: Vector Double, inputVector :: Vector Double, stepSize :: Double, tmax :: Double }