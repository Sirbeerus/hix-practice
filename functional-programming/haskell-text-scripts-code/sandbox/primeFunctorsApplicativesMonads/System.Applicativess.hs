-- Applicatives.. >>>Just (Function) allow us to wrap an function <*> to an (Just wraped value)
-- [(function) , (function)] <*> (Lists, Either, Maybe)


-- class Functor f => Applicative f where
--  pure :: a -> f a
--  (<*>) :: f (a -> b) -> f a -> f b
  
module System.Applicativess where

data Maybe' a = Just' a | Nothing' deriving (Show)

instance Functor Maybe' where
    fmap function (Just' a) = Just' (function a)
    fmap function Nothing'  = Nothing'    

    
instance Applicative Maybe' where
    pure = Just'
    Just' f <*> j = fmap f j -- fmap (+3) (Just' 1)
    Nothing' <*> j = Nothing'



asdf = Just' 5

-- ghci
-- :l System.Applicatives   

-- *System.Applicatives> Just' (+8) <*> (Just' 8) 
-- Just' 16

-- *System.Applicatives> Just' (+7) <*> asdf
-- Just' 12

-- *System.Applicatives> (+) <$> (Just' 9) <*> (Just' 2)
-- Just' 11

-- *System.Applicatives> [(*2),(+3)] <*> [1,2,3] 
-- [2,4,6,4,5,6]

    
       