module HW11 where

primes :: [Int]
primes = sieve [2..]

sieve :: [Int] -> [Int]
sieve [] = []
sieve (p:xs) = p : sieve [ x | x<-xs, x `mod` p /= 0]

