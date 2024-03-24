module Model.Dynamic.NonlinearSingleTrack (nonlinearSingleTrack) where

import Model.Dynamic.MagicFormula

nonlinearSingleTrack :: (Double -> Double) -> (Double -> Double) -> (Double -> [Double] -> [Double])
nonlinearSingleTrack delta vx = singleTrackModelInner 
    where
    singleTrackModelInner ts [vy, phi, phid, _, _] = [eq1, eq2, eq3, eq4, eq5]
        where
        -- main equations
        eq1 = (- (m * vx ts * phid) + mf alphaf * (cos . delta) ts + mf alphar) / m
        eq2 = phid
        eq3 = (lf * mf alphaf * (cos . delta) ts - lr * mf alphar) / theta
        eq4 = vx ts * cos phi - vy * sin phi
        eq5 = vy * cos phi + vx ts * sin phi

        -- side slip
        alphar = -(atan2 (vy - lr * phid) (vx ts))
        alphaf = -(atan2 vyft vxft)
        vxft = vx ts  * (cos . delta) ts + (sin . delta) ts * (vy + lf * phid)
        vyft = -(vx ts * (sin . delta) ts) + (cos . delta) ts * (vy + lf * phid)

        -- functions
        mf = magicFormula

        -- constants
        m = 1555
        theta = 2491
        lf = 1.354
        lr = 1.372
    
    singleTrackModelInner _ _ = error "Not properly defined"
