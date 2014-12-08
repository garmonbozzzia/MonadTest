module HW10 where

data Expr a =
    Val a
    | Add (Expr a) (Expr a)
    | Sub (Expr a) (Expr a)
    | Mul (Expr a) (Expr a)
    | Div (Expr a) (Expr a) deriving Show

vals :: [Expr Int]
vals = [Val 1, Val 3, Val 7, Val 10, Val 25, Val 50]

evalExpr :: Expr Int -> Maybe Int
evalExpr (Val a) = Just a
evalExpr (Add a b) = do
    x <- evalExpr a
    y <- evalExpr b
    Just (x+y)

evalExpr (Sub a b) = do
    x <- evalExpr a
    y <- evalExpr b
    Just (x-y)

evalExpr (Mul a b) =  do
    x <- evalExpr a
    y <- evalExpr b
    Just (x*y)


evalExpr (Div a b) =  do
    x <- evalExpr a
    y <- evalExpr b
    if x `mod` y == 0 then  Just (x `div` y)  else Nothing


--rs = iterate (\xs -> extend xs) vals

extend :: [Expr Int] -> [Expr Int]
extend xs = concat [ [Add x y, Sub x y, Mul x y, Div x y] | x <- xs, y <- xs]


