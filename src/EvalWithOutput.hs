module EvalWithOutput where

import Eval

type MOutput a = (a,Output)
type Output = String

evalWithOutput :: Term -> MOutput Int
evalWithOutput (Con n) = (n,line (Con n) n)
evalWithOutput (Div x y) = 
    let (a1,s1) = evalWithOutput x in
        let (a2,s2) = evalWithOutput y in
            (a1 `div` a2, s1 ++ s2 ++ line (Div x y) (a1 `div` a2 ))

line :: Term -> Int -> String
line t a = "eval" ++ show t ++ "<=" ++ show a ++ ")" ++ "\r\n"

