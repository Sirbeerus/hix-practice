{-# LANGUAGE OverloadedStrings #-}
module Main where

import Database.Redis 
import Data.ByteString.Char8 as B
import Control.Monad
import Control.Monad.IO.Class
import Data.Maybe
import System.IO
import Hello (creataKV)


createKV :: Redis ()
createKV = do
  -- Add exchange codes and their names
  liftIO $ B.putStrLn "Setting stock exchange code and their descriptions"
  set "XSES" "Singapore Stock Exchange"
  set "XBSE" "Bombay Stock Exchange"
  set "XNSE" "National Stock Exchange of India"
  -- Delete a key
  del ["XBSE"]
  -- Get the values back
  xses <- get "XSES"
  xbse <- get "XBSE"
  xnse <- get "XNSE"
  -- Delete a key
  let xchanges = (,,) <$> xses <*> xbse <*> xnse
  liftIO $ print xchanges

createList :: Redis ()
createList = do
  -- Push symbols in a list of stocks
  liftIO $ B.putStrLn "Adding symbols to the stock list"
  lpush "STOCKS" ["AAPL"]
  lpush "STOCKS" ["GOOGL"]
  lpush "STOCKS" ["FB"]
  -- Get all symbols. (-1) indicates end of the range.
  symbols <- lrange "STOCKS" 0 (-1)
  liftIO $ print symbols
  liftIO $ B.putStrLn "Changing some stocks and removing some"
  -- Set a value to something else
  lset "STOCKS" 0 "GOOGLE"
  -- Remove all values for FB
  lrem "STOCKS" 0 "FB"
  symbols1 <- lrange "STOCKS" 0 3
  liftIO $ B.putStrLn "Printing new stock list"
  liftIO $ print symbols1

createHash :: Redis ()
createHash = do
  liftIO $ B.putStrLn "Set hashes for AAPL and FB"
  hset "AAPL" "CATEGORY" "TECH"
  hset "FB" "CATEGORY" "SOCIAL"
  hmset "AAPL" [("HINT", "BUY"),("SENTIMENT","POSITIVE")]
  -- Get FB Category
  fbcat <- hget "FB" "CATEGORY"
  liftIO $ B.putStrLn "Print FB Category"
  liftIO $ print fbcat
  -- Get multiple fields
  aapls <- hmget "AAPL" ["HINT","SENTIMENT"]
  liftIO $ B.putStrLn "What is suggestion for AAPL"
  liftIO $ print aapls

main :: IO ()
main = do
  -- Connect with default information
  conn <- checkedConnect defaultConnectInfo
  runRedis conn $ do 
  createKV
  createList
  createHash
  creataKV
  return ()
  




