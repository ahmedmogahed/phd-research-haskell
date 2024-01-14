module Type.StateSpace where

import Numeric.LinearAlgebra

data StateSpaceSystem = StateSpaceSystem (Matrix Double) (Matrix Double) (Matrix Double) (Matrix Double) deriving (Show)
