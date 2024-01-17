module Main (main) where

import Model.LinearSingleTrack (linearSingleTrackModel)

main :: IO ()
main = do
  let ss = linearSingleTrackModel 10
  print ss
