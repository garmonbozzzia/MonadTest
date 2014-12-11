-- | Main entry point to the application.
module Main where

import Eval
import EvalWithExc
import EvalWithState
import EvalWithOutput
import EvalWithMonad

--import HW8
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

    putStr "subs: "
    print $ show $ subs [1,2,3]
    putStr "interleave: "
    print $ interleave 1 [2,3,4,5]
    putStr "perms: "
    print $ perms [1,2,3]
    --print $ concat $ map perms (subs [1,2,3])
    putStr "removeone: "
    print $ removeone 2 [1,2,3,2,1]
    putStr "split: "
    print $ split [1,2,3]
    --print $ exprs [1,2]
    print $ solutions [1,3,7,10,25,50] 765
    --print $ length $ solutions [3,7,11,29,42] 780

    --print $ split [1,2,3,4,5]    
    --print $ choises [1,2]
    --print $ (\y->map (ins 0) $ [([],y), (y,[])] ++ split y ) [1,2,3]

    --foldLeftM (\a b -> putChar b >> return (b : a ++ [b])) [] "haskell" Prelude.>>= \r -> putStrLn r
    --foldRightM (\a b -> putChar a >> return (a:b)) [] (show [1,3..10]) Prelude.>>= \r -> putStr r
    --print $ sequence' ["12","34"]

    --print $ extend vals