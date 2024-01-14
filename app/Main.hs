module Main (main) where

import Numeric.LinearAlgebra.Data
import Type.StateSpace

main :: IO ()
main = do
  let a = (2 >< 2) [0, 1, -4, -10]
  let b = (2 >< 2) [4, -4, 10, 2]
  let c = (1 >< 2) [1, 0]
  let d = (1 >< 1) [1]
  let ss = StateSpaceSystem a b c d

  print ss
