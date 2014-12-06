module EvalWithExc where

import Eval

data MTry a = Raise Exception | Return a deriving Show
type Exception = String

evalWithExc :: Term -> MTry Int
evalWithExc (Con n) = Return n
evalWithExc (Div n m) = case evalWithExc n of
     Raise e -> Raise e
     Return x -> case evalWithExc m of
        Raise e -> Raise e
        Return y -> if y == 0
            then Raise "divide by zero"
            else Return (x `div` y)