{-# LANGUAGE OverloadedStrings #-}

module Main where

import Database.Redis
main :: IO (Either Reply Status)
main = do
conn <- connect defaultConnectInfo
runRedis conn ping

