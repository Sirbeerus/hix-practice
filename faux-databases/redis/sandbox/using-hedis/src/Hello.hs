{-# LANGUAGE OverloadedStrings #-}

module Hello where

import Database.Redis
import Data.ByteString.Char8 as B
import Control.Monad
import Control.Monad.IO.Class
import Data.Maybe
import System.IO 


creataKV :: Redis ()
creataKV = do
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

