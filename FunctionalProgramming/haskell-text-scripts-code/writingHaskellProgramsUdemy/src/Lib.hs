module Lib
    ( someFunc,
      myAdd,
      mySub
    ) where

import Internal

someFunc :: IO ()
someFunc =  do
    putStrLn $ "Another Funky Lambda=" ++ show (myAdd 123 456) 
    putStrLn $ "MyTrue=" ++ show MyTrue

myAdd :: Int -> Int -> Int
myAdd x y = x + y

mySub :: Int -> Int -> Int
mySub f t = f - t
