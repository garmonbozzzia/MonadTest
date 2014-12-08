module Eval where

data Term = Con Int | Div Term Term deriving Show

eval :: Term -> Int
eval (Con a) = a
eval (Div a b) = eval a `div` eval b

answer, errorTerm :: Term
answer  = Div (Div (Con 1972) (Con 2)) (Con 23)
errorTerm   = Div (Con 1) (Con 0)