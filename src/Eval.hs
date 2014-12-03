module Eval where

data Term = Con Int | Div Term Term

eval :: Term -> Int
eval (Con a) = a
eval (Div a b) = eval a `div` eval b
