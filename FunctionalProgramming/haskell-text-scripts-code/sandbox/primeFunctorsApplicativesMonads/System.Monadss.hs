-- Monad, is a TYPECLASS
-- Monad applies a function (regular function (+7)(*8)) to a wrapped value and returns a wrapped value

-- bind    
-- (>>=) :: m a -> (a -> m b) -> m b
-- 'm' = Monad
-- m a = (Just' 4) 
-- (a -> m b) = half

-- fmap f (Just a) = Just (f a)
    
module System.Monadss where

data Maybe' a = Just' a | Nothing' deriving (Show)

instance Monad' Maybe' where
    Just' foo >>= bar = bar foo 
    Nothing' >>= _ = Nothing'


class Monad' m where
    (>>=) :: m a -> (a -> m b) -> m b


half x = if even x 
        then Just' (x `div` 2)
        else Nothing'


-- ghci    
-- :l System.Monadss

-- *System.Monadss> half 4
-- Just 2

-- *System.Monadss>  half (Just 4)
-- error

-- *System.Monadss> (Just 4) >>= half
-- Just 2

-- *System.Monadss> (Just 4) >>= half >>= half
-- Just 1