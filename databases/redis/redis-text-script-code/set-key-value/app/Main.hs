{-# LANGUAGE OverloadedStrings #-}

module Main where

import Database.Redis
import qualified Data.ByteString.Char8 as B
import System.IO
import Control.Monad
import Control.Monad.IO.Class
import Data.Maybe

createKeyValue :: Redis ()
createKeyValue = do
  -- Add exchange codes and their names
  liftIO $ B.putStrLn "Setting stock exchange code and their descriptions" 
  set "fNAME" "nicholas"
  set "mNAME" "john"
  set "lNAME" "childs"
  first <- get "fNAME"
  middle <- get "mNAME"
  last <- get "lNAME"
  let fullName = (,,) <$> first <*> middle <*> last
  liftIO $ print fullName

main :: IO ()
main = do
 -- Connect with default information
 conn <- checkedConnect defaultConnectInfo
 runRedis conn $ do
 createKeyValue
 return ()
