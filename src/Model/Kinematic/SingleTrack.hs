module Model.Kinematic.SingleTrack (kinematicSingleTrack) where

import Numeric.LinearAlgebra
import Type.ModelStateFunction

kinematicSingleTrack :: StateFunction
kinematicSingleTrack x u _ = vector [posxd, posyd, vd, psid]
  where
    -- new states
    posxd = v * cos (psi + beta)
    posyd = v * sin (psi + beta)
    vd = a
    psid = v / lr * sin beta

    beta = atan2 (lr * tan delta) (lf + lr)

    -- inputs 
    a = u ! 0
    delta = u ! 1

    -- states
    v = x ! 2
    psi = x ! 3

    -- parameters
    lf = 1.354
    lr = 1.372