module Main (main) where

import Model.LinearSingleTrack (linearSingleTrackModel)
import Algorithm.Discrete (eulerAlgorithm)

main :: IO ()
main = do
  -- linear single track model
  let ss = linearSingleTrackModel 10
  -- model discretization
  let ssd = eulerAlgorithm ss 0.1
  print ssd
