module HW10 where

data Op = Add | Sub | Mul | Div 
instance Show Op where
    show Add = " + "
    show Sub = " - "
    show Mul = " * "
    show Div = " / "

vals :: [Int]
vals = [1,3,7,10,25,50]

apply :: Op -> Int -> Int -> Int
apply Add x y = x+y
apply Sub x y = x-y
apply Mul x y = x*y
apply Div x y = x `div` y

valid :: Op -> Int -> Int -> Bool
valid Add x y = x <= y
valid Sub x y = x >= y
valid Mul x y = x <= y && x /= 1 && y /= 1
valid Div x y = y > 1 && x `mod` y == 0

data Expr = Val Int | App Op Expr Expr
instance Show Expr where
    show (Val n) = show n
    show (App op a b) = "(" ++ (show a) ++ show op ++ (show b) ++ ")"

evalExpr :: Expr -> [Int]
evalExpr (Val a) = [a | a > 0]
evalExpr (App op a b) = [apply op x y | x <- evalExpr a, y <- evalExpr b, valid op x y ]

vs :: [Expr]
vs = map Val vals

values :: Expr -> [Int]
values (Val n) = [n]
values (App _ a b) = values a ++ values b

solution :: Expr -> [Int] -> Int -> Bool
solution e ns n = elem (values e) (choises ns) && evalExpr e == [n]

exprs :: [Int] -> [Expr]
exprs [n] = [Val n]
exprs ns = [e | (ln,rn) <-split ns
              , l       <- exprs ln
              , r       <- exprs rn
              , e       <- combine l r ]

solutions :: [Int] -> Int -> [Expr]
solutions ns n = [e | ns'   <- choises ns
                    , e     <- exprs ns'
                    , evalExpr e == [n]]

combine :: Expr -> Expr -> [Expr]
combine l r = [App op l r | op <- [Add,Sub,Mul,Div]]

split :: [a] -> [([a],[a])]
split [] = []
split [_] = []
--split [x,y] = [([x],[y])]
--split (x:xs) = [([x],xs)] ++ (map (\(as,bs)-> (x:as,bs)) $ split xs)
split (x:xs) = ([x],xs) : [(x:as,bs) | (as,bs) <- split xs]

choises :: [a] -> [[a]]
--choises xs = concat $ map perms (subs xs)
choises xs = [zs | ys <- subs xs , zs <- perms ys]

removeone :: Eq a => a -> [a] -> [a]
removeone _ [] = []
removeone x (y:ys)
    | x == y = ys
    | otherwise = y : removeone x ys

isChoise :: Eq a => [a] -> [a] -> Bool
isChoise [] _ = True
isChoise (_:_) [] = False
isChoise (x:xs) ys = elem x ys && isChoise xs (removeone x ys)


subs :: [a]->[[a]]
subs [] = [[]]
subs (x:xs) = sxs ++ map (x:) sxs where 
    sxs = subs xs

interleave :: a -> [a] -> [[a]]
interleave x [] = [[x]]
interleave x (y:ys) = (x:y:ys) : map (y:) (interleave x ys)

perms :: [a]->[[a]]
perms [] = [[]]
perms (x:xs) = concat $ map (interleave x) (perms xs)

ins :: a -> ([a],[a]) -> [a]
ins x (xs,ys) = xs ++ [x] ++ ys