import Data.List
import System.IO
import Data.Char 

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)


prodFact n = product [1..n]

isOdd :: Int -> Bool
isOdd n
  | n `mod` 2 == 0 = False
  | otherwise = True


isEven n = n `mod` 2 == 0 

whatGrade :: Double -> String
whatGrade age
  | (age >= 5)  && (age <= 6)   = "Kindergarten"
  | (age >= 6)  && (age <= 10)  = "Elementary School"
  | (age >= 10) && (age <= 14) = "Middle School"
  | (age >= 14) && (age <= 18) = "High School"
  | otherwise = "College"


batAvgRating :: Double -> Double -> String
batAvgRating hits atBats
  | avg <= 0.200 = "Terrible Batting Average"
  | avg <= 0.250 = "Average Player"
  | avg <= 0.280 = "Above Average"
  | otherwise    = "Super Star"
  where avg = hits/ atBats
  
getListItems :: [Int] -> String
getListItems [] = "Your List is Empty"
getListItems (x:[]) = "Your list starts with" ++ show x
getListItems (x:y:[]) = "Your list contains" ++ show x ++ "and" ++ show y
getListItems (x:xs) = "The 1st item is " ++ show x ++ " and the rest are " ++ show xs 

getFirstItem :: String -> String 
getFirstItem [] = "Empty String"
getFirstItem all@(x:xs) = "The first letter in " ++ all ++ " is " ++ [x]


times4 :: Int -> Int
times4 x = x * 4

listTimes4 = map times4 [1,2,3,4,5]

multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs

areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True
areStringsEq (x:xs) (y:ys) = x == y && areStringsEq xs ys
areStringsEq _ _ = False

doMult :: (Int -> Int) -> Int
doMult func = func 3

num3Times4 = doMult times4

example = [2,4,7]







isVowel :: Char -> Bool

isVowel 'a' = True
isVowel 'e' = True
isVowel 'i' = True
isVowel 'o' = True
isVowel 'u' = True

isVowel _ = False



















gcd' :: Integral a => a -> a -> a 
gcd' a 0 = a
gcd' a b = gcd' b (a `rem` b)


























sumElts :: Num a => [a] -> a

sumElts [] = 0
sumElts (x:xs) = x + sumElts xs

oddElements :: [a] -> [a]

oddElements (x:_:xs) = x : oddElements xs
oddElements l = l



evenElements :: [a] -> [a]

evenElements (_:x:xs) = x : evenElements xs
evenElements l = []




positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (q ,i) <- zip xs [0..], x == q]





count :: Char -> String -> Int
count x xs = length [q | q <- xs, x == q]





  














































