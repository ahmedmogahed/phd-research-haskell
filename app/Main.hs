module Main (main) where

import Model.MagicFormula (magicFormulaDeg)

main :: IO ()
main = do
  print $ map magicFormulaDeg [10,20,40,69]
