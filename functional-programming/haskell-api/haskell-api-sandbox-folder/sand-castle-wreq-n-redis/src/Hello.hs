{-# LANGUAGE OverloadedStrings #-}

module Hello where

import Database.Redis
import Data.ByteString.Char8 as B
import Control.Monad
import Control.Monad.IO.Class
import Data.Maybe
import System.IO 



main :: IO ()
main = print "hello world"
