module Algorithm.Discrete (eulerAlgorithm, zeroOrderHold, backwardIntegration, bilinearTransform) where

import Numeric.LinearAlgebra.Data
import Numeric.LinearAlgebra (scale, inv, expm)
import Type.StateSpace

eulerAlgorithm :: StateSpaceSystem -> Double -> StateSpaceSystem
eulerAlgorithm (StateSpaceSystem a b c d) ts = StateSpaceSystem ad bd cd dd
  where
    ad = ident (rows a) + scale ts a
    bd = scale ts b
    cd = c
    dd = d

zeroOrderHold :: StateSpaceSystem -> Double -> StateSpaceSystem
zeroOrderHold (StateSpaceSystem a b c d) ts = StateSpaceSystem ad bd cd dd
  where
    ad = expm (scale ts a)
    bd = inv a <> (ad - ident (rows ad)) <> b
    cd = c
    dd = d

backwardIntegration :: StateSpaceSystem -> Double -> StateSpaceSystem
backwardIntegration (StateSpaceSystem a b c d) ts = StateSpaceSystem ad bd cd dd
  where
    ad = inv (ident (rows a) - scale ts a)
    bd = ad <> scale ts b
    cd = c <> ad
    dd = d + (c <> bd)

bilinearTransform ::  StateSpaceSystem -> Double -> StateSpaceSystem
bilinearTransform (StateSpaceSystem a b c d) ts = StateSpaceSystem ad bd cd dd
  where
    ad = ad1 <> ad2
    bd = ad2 <> b
    cd = c <> scale ts  ad2
    dd = d + (c <> scale (ts/2) bd)

    ad1 = ident (rows a) + scale (ts/2) a
    ad2 = inv (ident (rows a) - scale (ts/2) a)
