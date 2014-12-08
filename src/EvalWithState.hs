module EvalWithState where

import Eval

type State = Int
type MState a = State -> (a,State)

evalWithState :: Term -> MState Int
evalWithState (Con n) s = (n,s)
evalWithState (Div n m) s =
    let (x,s1) = evalWithState n s in
    let (y,s2) = evalWithState m s1 in
        (x `div` y, s2 + 1)