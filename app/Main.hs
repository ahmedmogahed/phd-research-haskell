module Main (main) where

import Model.MagicFormula (magicFormulaDeg)
import Algorithm.Discrete
import Numeric.LinearAlgebra


main :: IO ()
main = do
  let a = (2><2) [0,1,-4,-10]
  let b = (2><1) [0,1]
  let c = (1><2) [0,1]
  let d = (1><1) [0]
  print $ bilinearTransform (a,b,c,d) 0.1
