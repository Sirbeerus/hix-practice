module Internal where

data MyBool = MyTrue | MyFalse deriving (Eq, Show)


myMult :: Int -> Int -> Int
myMult x y = x * y