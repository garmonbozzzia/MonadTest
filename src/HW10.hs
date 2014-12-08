module HW10 where

data Op = Add | Sub | Mul | Div deriving Show

vals :: [Int]
vals = [1,3,7,10,25,50]

apply :: Op -> Int -> Int -> Int
apply Add x y = x+y
apply Sub x y = x-y
apply Mul x y = x*y
apply Div x y = x `div` y

valid :: Op -> Int -> Int -> Bool
valid Add _ _ = True
valid Sub x y = x > y
valid Mul _ _ = True
valid Div x y = x `mod` y == 0

data Expr = Val Int | App Op Expr Expr deriving Show
evalExpr :: Expr -> [Int]
evalExpr (Val a) = [a]
evalExpr (App op a b) = [apply op x y | x <- evalExpr a, y <- evalExpr b, valid op x y ]

vs :: [Expr]
vs = map Val vals

extend :: [Expr] -> [Expr]
extend xs =  [ App op x y | x <- xs, y <- xs, op <- [Add, Sub, Mul, Div], z <- evalExpr (App op x y) ]
