-- | Main entry point to the application.
module Main where

import Eval
import EvalWithExc
import EvalWithState
import EvalWithOutput
import EvalWithMonad

import HW8
import HW10

-- | The main entry point.
main :: IO ()
main = do
    putStrLn "Welcome to FP Haskell Center!"
    --print $ eval (Con 1)
    --print $ eval (Div (Con 10) (Con 2))
    print $ eval answer
    print $ evalWithExc answer
    print $ evalWithExc errorTerm
    print $ evalWithState answer 0
    print $ evalWithOutput answer
    print $ evalWithExc answer

    --print $ evalM errorTerm
    print $ evalM answer
    --print $ eval errorTerm
    putStrLn "Have a good day!"

    --foldLeftM (\a b -> putChar b >> return (b : a ++ [b])) [] "haskell" Prelude.>>= \r -> putStrLn r
    --foldRightM (\a b -> putChar a >> return (a:b)) [] (show [1,3..10]) Prelude.>>= \r -> putStr r
    --print $ sequence' ["12","34"]

    --print $ extend vals