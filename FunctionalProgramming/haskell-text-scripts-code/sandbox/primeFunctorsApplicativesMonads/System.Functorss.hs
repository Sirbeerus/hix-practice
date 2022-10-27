-- Functors.. applying an (function) to <$> a (wrapped value)

-- a Functor is a TYPECLASS
-- a TYPECLASS is like an interface 

-- class Functor f where   
--    fmap :: a -> b -> f a -> f b

-- Data Maybe a = Just a | Nothing

module System.Functorss where  

-- import Lib 

data Maybe' a = Just' a | Nothing' deriving (Show)

instance Functor Maybe' where
    fmap function (Just' a) = Just' (function a)
    fmap function Nothing'  = Nothing'

-- INFIX NOTATION 
--        (function) <$> (Just' _)   

asdf = Just' 5


-- ghci
-- :l System.Functorss

-- *System.Applicativess> (+7) <$> (Just' 8)
-- Just' 15

-- *System.Applicativess> (+3) <$> asdf
-- Just' 8






----------------------------------------------------


-- Haskell  defines Functors for (Maybe, Either, Lists)

data Tree a = Leaf a | Branch (Tree a) (Tree a) deriving Show

instance Functor Tree where
    fmap function (Leaf a) = Leaf (function a)
    fmap function (Branch left right) = Branch (fmap function left) (fmap function right)
--                                             (f <$> left) (f <$> right)  
    
    
zxcv = Branch (Leaf 4)(Branch(Leaf 5)(Leaf 6))


--------------

-- https://www.reddit.com/r/haskellquestions/comments/8uea9b/why_can_i_only_import_systemrandom_if_i_use_the/?utm_medium=android_app&utm_source=share

-- https://docs.haskellstack.org/en/stable/stack_yaml_vs_cabal_package_file/
