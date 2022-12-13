
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Database.Redis
import qualified Data.ByteString.Char8 as B

byte = B.pack "hello world"

 
main :: IO (Either Reply B.ByteString)
main = do
conn <- connect defaultConnectInfo
runRedis conn $ echo byte


{-

The echo Redis command is used to print a message that is passed as an argument to it. The equivalent hedis echo command expects the message to be of type ByteString.

https://www.opensourceforu.com/2015/05/access-redis-and-postgresql-databases-with-haskell/

-}

