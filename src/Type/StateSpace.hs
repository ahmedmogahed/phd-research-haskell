module Type.StateSpace (StateSpaceSystem (StateSpaceSystem)) where

import Numeric.LinearAlgebra

data StateSpaceSystem = StateSpaceSystem (Matrix Double) (Matrix Double) (Matrix Double) (Matrix Double) deriving (Show)
