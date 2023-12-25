module Main (main) where

import Model.LinearSingleTrack
import Model.MagicFormula (magicFormulaDeg)
import Model.NonlinearSingleTrack (nonlinearSingleTrack)

main :: IO ()
main = do
  print $ magicFormulaDeg 12.3
