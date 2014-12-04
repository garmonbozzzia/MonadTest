module Eval where

data Term = Con Int | Div Term Term

eval :: Term -> Int
eval (Con a) = a
eval (Div a b) = eval a `div` eval b

data Try a = Raise Exception | Return a deriving Show
type Exception = String

evalWithExc :: Term -> Try Int
evalWithExc (Con n) = Return n
evalWithExc (Div n m) = case evalWithExc n of
     Raise e -> Raise e
     Return x -> case evalWithExc m of
        Raise e -> Raise e
        Return y -> if y == 0
            then Raise "divide by zero"
            else Return (x `div` y)

type State = Int
type MState a = State -> (a,State)

evalWithState :: Term -> MState Int
evalWithState (Con n) s = (n,s)
evalWithState (Div n m) s =
    let (x,s1) = (evalWithState n) s in
    let (y,s2) = (evalWithState m) s1 in
        (x `div` y, s2 + 1)

answer, errorTerm :: Term
answer  = (Div (Div (Con 1972) (Con 2)) (Con 23))
errorTerm   = (Div (Con 1) (Con 0))