{-# LANGUAGE OverloadedStrings #-}

module Main where

import Database.Redis
import Data.ByteString.Char8 as B
import Control.Monad
import Control.Monad.IO.Class
import Data.Maybe
import System.IO

createList :: Redis ()
createList = do

  liftIO $ B.putStrLn "Adding to the stock list"

  lpush "stocks" ["three"]
  lpush "stocks" ["two"]
  lpush "stocks" ["one"]
  
  lset "stocks" 0  "IOG"
  lset "stocks" 1  "AAPL"
  lset "stocks" 2  "META"
  
  ticker <- lrange "stocks" 0 2
  liftIO $ print ticker

main :: IO ()
main = do
  -- Connect with default information
  conn <- checkedConnect defaultConnectInfo
  runRedis conn $ do
  createList
  return ()
