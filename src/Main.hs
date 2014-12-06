-- | Main entry point to the application.
module Main where

import Eval

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
    putStrLn $ show (evalWithOutput answer)
    --print $ eval errorTerm
    putStrLn "Have a good day!"
