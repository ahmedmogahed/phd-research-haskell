module Main (main) where

import Model.LinearSingleTrack

main :: IO ()
main = do
  print $ linearSingleTrackModel 12
