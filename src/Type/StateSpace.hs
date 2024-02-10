module Type.StateSpace (StateSpaceSystem (StateSpaceSystem)) where

import Numeric.LinearAlgebra

type DMatrix = Matrix Double

data StateSpaceSystem = StateSpaceSystem !DMatrix !DMatrix !DMatrix !DMatrix deriving (Show)
