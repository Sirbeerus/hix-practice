{-# LANGUAGE DeriveGeneric, OverloadedStrings, ScopedTypeVariables, DeriveAnyClass #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}

module Main where

import qualified Network.Wreq as W
import Control.Lens ((&), (^.), (^?), (.~))
import qualified Data.Text.IO as T
import Control.Monad (forM_)
import Data.Aeson.Lens (key)
import Data.Aeson.Types
import Data.Map as Map
import Data.Aeson (Value)
import qualified Database.Redis as R  
import qualified Data.ByteString as B

main :: IO ()
main = do
 r <- W.get "https://server.jpgstoreapis.com/policy/a51b52822dc9fec24c00a110d3ef509b799b06436872714ca4d4a942/listings?page=1"
 print (r)


