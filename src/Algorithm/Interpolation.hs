module Algorithm.Interpolation (linearInterpolation) where

import Numeric.LinearAlgebra

linearInterpolation :: Vector Double -> Matrix Double -> Double -> Vector Double
linearInterpolation time state ts
  | rows state == 0 = error "empty vector"
  | null after = x1
  | null before = x2
  | abs (t1 - ts) < 1e-7 = x1
  | abs (t2 - ts) < 1e-7 = x2
  | otherwise = x1 + scalar (ts - t1) * (x2 - x1) / scalar (t2 - t1)

  where
    t1 = last before
    t2 = head after
    x1 = state ! (lb - 1)
    x2 = state ! lb

    (before, after) = span (< ts) (toList time)
    lb = length before