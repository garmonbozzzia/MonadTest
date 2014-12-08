module HW8 where


sequence' :: Monad m => [m a] -> m [a]
sequence' [] = return []
sequence' (x:xs) = do
    a <- x
    as <- sequence' xs
    return (a:as)

mapM' :: Monad m => (a -> m b) -> [a] -> m [b]
mapM' f xs = sequence' (map f xs)

foldLeftM :: Monad m => (a -> b -> m a) -> a -> [b] -> m a
foldLeftM _ a [] = return a
foldLeftM f a (x:xs) = f a x >>= \r-> foldLeftM f r xs

foldRightM :: Monad m => (a -> b -> m b) -> b -> [a] -> m b
foldRightM _ a [] = return a
foldRightM f a (x:xs) = foldRightM f a xs >>= \r-> f x r


--foldl :: (a -> b -> a) -> a -> [b] -> a
--foldl f a [] = a
--foldl f a (x:xs) = foldl f (f a x) xs