module Type.ModelStateFunction (StateFunction, StateVector, InputVector, TimeInstant) where 
import Numeric.LinearAlgebra

type StateVector = Vector Double
type InputVector = Vector Double
type TimeInstant = Double

-- state function takes the following two vectors and one double scalar: the state vector, the input vector, and the time instant
type StateFunction = (StateVector -> InputVector -> TimeInstant -> StateVector)
