module Model.SingleTrack (kinematicSingleTrack) where

import Numeric.LinearAlgebra
import Type.ModelStateFunction

kinematicSingleTrack :: StateFunction
kinematicSingleTrack x u _ = vector [posxd, posyd, psid]
  where
    -- new states
    posxd = v * cos (psi + beta)
    posyd = v * sin (psi + beta)
    psid = v / lr * sin beta

    beta = atan2 (lr * tan delta) (lf + lr)

    -- inputs 
    v = u ! 0
    delta = u ! 1

    -- states
    psi = x ! 2

    -- parameters
    lf = 1.354
    lr = 1.372