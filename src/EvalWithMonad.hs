{-# LANGUAGE TypeSynonymInstances #-}
module EvalWithMonad where
import Eval
import EvalWithExc
import EvalWithState()

class M m where
    unit :: a -> m a
    (>>=) :: m a -> (a->m b) -> m b

    --evalWithMonad :: Term -> m a

    --evalWithMonad (Con a) = unit
instance M MTry where
    unit x = Return x
    (Raise e) >>= _ = Raise e
    (Return x) >>= f = f x

evalM :: Term -> MTry Int
evalM (Con n) = unit n
evalM (Div x y) = evalM x EvalWithMonad.>>= \a -> evalM y EvalWithMonad.>>= \b -> unit (a `div` b)