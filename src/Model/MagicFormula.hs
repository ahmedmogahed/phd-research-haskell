module Model.MagicFormula (magicFormulaDeg, magicFormula) where 

import Lib

-- Magic Formula functions with alpha in degrees as argument
magicFormulaDeg :: Double -> Double
magicFormulaDeg = magicFormula . deg2rad

-- Magic Formula functions with alpha in radians as argument
magicFormula :: Double -> Double
magicFormula alpha = magicFormulaRaw alpha 2000 0

-- Magic Formula functions with alpha (radians), force (newtons) and gamma (radians)
magicFormulaRaw :: Double -> Double -> Double -> Double
magicFormulaRaw alpha fz gamma = d * sin(c * atan(b * phi)) + dSv
    where
    -- main variables
    c = 1.3
    d = a1 * fzk ** 2 + a2 * fzk
    b = a3 * sin(a4 * atan(a5 * fzk)) / (c * d) * (1 - a12 * abs gammad)
    phi = (1 - e) * alpha_dSh + e / b * atan(b * alpha_dSh)
    dSv = (a10 * fzk ** 2 + a11 * fzk) * gammad

    e = a6 * fzk ** 2 + a7 * fzk + a8
    alpha_dSh = alphad + dSh
    dSh = a9 * gammad

    -- conversions (angles: rad to degs, force: N to KN)
    alphad = rad2deg alpha; fzk = fz / 1e3; gammad = rad2deg gamma

    -- constants
    a1 = -22.1; a2 = 1011; a3 = 1078; a4 = 1.82; a5 = 0.208; a6 = 0.000
    a7 = -0.354; a8 = 0.707; a9 = 0.028; a10 = 0.000; a11 = 14.8; a12 = 0.022
