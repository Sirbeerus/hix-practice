{-# LANGUAGE DeriveGeneric, OverloadedStrings, ScopedTypeVariables, DeriveAnyClass #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
module Main where

-- Examples of handling for JSON responses
--
-- This library provides several ways to handle JSON responses


import Network.Wreq
import Control.Lens ((&), (^.), (^?), (.~))
import qualified Data.Text.IO as T
import Control.Monad (forM_)
import Data.Aeson.Lens (key)
import Data.Aeson.Types
import Data.Map as Map
import Data.Aeson (Value)


{-
-- Original
import Control.Lens ((&), (^.), (^?), (.~))
import Data.Aeson (FromJSON)
import Data.Aeson.Lens
import Data.Map (Map)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Control.Exception as E



-- This Haskell type corresponds to the structure of a response body
-- from httpbin.org.

data GetBody = GetBody {
    headers :: Map Text Text
  , args :: Map Text Text
  , origin :: Text
  , url :: Text
  } deriving (Show, Generic)

-- Get GHC to derive a FromJSON instance for us.

instance FromJSON GetBody



-- We expect this to succeed.

basic_asJSON :: IO ()
basic_asJSON = do
  let opts = defaults & param "foo" .~ ["bar"]
  r <- asJSON =<< getWith opts "https://server.jpgstoreapis.com/policy/a51b52822dc9fec24c00a110d3ef509b799b06436872714ca4d4a942/listings?page=1"

  -- The fact that we want a GetBody here will be inferred by our use
  -- of the "headers" accessor function.

  putStrLn $ "args: " ++ show (args (r ^. responseBody))



-- The response we expect here is valid JSON, but cannot be converted
-- to an [Int], so this will throw a JSONError.

failing_asJSON :: IO ()
failing_asJSON = do
  (r :: Response [Int]) <- asJSON =<< get "https://server.jpgstoreapis.com/policy/a51b52822dc9fec24c00a110d3ef509b799b06436872714ca4d4a942/listings?page=1"
  putStrLn $ "response: " ++ show (r ^. responseBody)



-- This demonstrates how to catch a JSONError.

failing_asJSON_catch :: IO ()
failing_asJSON_catch =
  failing_asJSON `E.catch` \(e :: JSONError) -> print e



-- Because asJSON is parameterized over MonadThrow, we can use it with
-- other instances.
--
-- Here, instead of throwing an exception in the IO monad, we instead
-- evaluate the result as an Either:
--
-- * if the conversion fails, the Left constructor will contain
--   whatever exception describes the error
--
-- * if the conversion succeeds, the Right constructor will contain
--   the converted response

either_asJSON :: IO ()
either_asJSON = do
  r <- get "https://server.jpgstoreapis.com/policy/a51b52822dc9fec24c00a110d3ef509b799b06436872714ca4d4a942/listings?page=1"

  -- This first conversion attempt will fail, but because we're using
  -- Either, it will not throw an exception that kills execution.
  let failing = asJSON r :: Either E.SomeException (Response [Int])
  print failing

  -- Our second conversion attempt will succeed.
  let succeeding = asJSON r :: Either E.SomeException (Response GetBody)
  print succeeding



-- The lens package defines some handy combinators for use with the
-- aeson package, with which we can easily traverse parts of a JSON
-- response.

lens_aeson :: IO ()
lens_aeson = do
  r <- get "https://server.jpgstoreapis.com/policy/a51b52822dc9fec24c00a110d3ef509b799b06436872714ca4d4a942/listings?page=1"
  print $ r ^? responseBody . key "headers" . key "User-Agent"

  -- If we maintain the ResponseBody as a ByteString, the lens
  -- combinators will have to convert the body to a Value every time
  -- we start a new traversal.

  -- When we need to poke at several parts of a response, it's more
  -- efficient to use asValue to perform the conversion to a Value
  -- once.

  let opts = defaults & param "baz" .~ ["quux"]
  v <- asValue =<< getWith opts "https://server.jpgstoreapis.com/policy/a51b52822dc9fec24c00a110d3ef509b799b06436872714ca4d4a942/listings?page=1"
  print $ v ^? responseBody . key "args" . key "baz"



main :: IO ()
main = do
--  basic_asJSON
--  failing_asJSON_catch
--  either_asJSON
--  lens_aeson

-}
