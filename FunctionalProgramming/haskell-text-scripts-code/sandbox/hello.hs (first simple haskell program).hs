module Main where

import Distribution.Compat.Prelude.Internal    

greetings :: String 
greetings = "Hello world!"



main :: IO ()
main = do
    putStrLn greetings