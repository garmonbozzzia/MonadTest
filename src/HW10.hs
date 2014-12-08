module HW10 where

data Op = Add | Sub | Mul | Div

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
valid Div x y = y > 0 && x `mod` y == 0




