module Model.LinearSingleTrack (linearSingleTrackModel) where

import Numeric.LinearAlgebra
import Type.StateSpace

linearSingleTrackModel :: Double -> StateSpaceSystem
linearSingleTrackModel vx = StateSpaceSystem a b c d
    where
    -- dynamic matrix
    a = (3><3)
        [ a11, 0, a13
        , 0, 0, 1
        , a31, 0, a33]

    a11 = -((cah + cav) / (m * vx))
    a13 = (cah * lh - cav * lv - m * vx ** 2) / (m * vx ** 2)
    a31 = (cah * lh - cav * lv) / theta
    a33 = (-(cah * lh ** 2) - cav * lv ** 2) / (theta * vx)

    -- Input matrix
    b = (3><1)
        [cav / (m * vx), 0, (cav * lv) / theta]

    -- output matrix
    c = (2><3)
        [1, 0, 0
        ,0, 1, 0]

    -- feedforword matrix
    d = (1><2)
        [0, 0]

    -- constants
    m = 1555
    theta = 2491
    lh = 1.372
    lv = 1.354
    cav = 100000
    cah = 160000
