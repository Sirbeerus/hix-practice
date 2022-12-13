{-
Copyright (c) 2010-2011, Alexander Bogdanov <andorn@gmail.com>
License: MIT
-}

{-# LANGUAGE PackageImports, TypeSynonymInstances, FlexibleInstances #-}
-- | This module is mainly an example of posible 'WithRedis'
-- implementation
module Database.Redis.Monad.State where

import "mtl" Control.Monad.State
import Database.Redis.Monad (WithRedis(..), Redis)

-- | Trivial WithRedis instance storing Redis descriptor in StateT
type RedisM = StateT Redis IO

instance WithRedis RedisM where
    getRedis = get
    setRedis = put

runWithRedis :: Redis -> (RedisM a) -> IO a
runWithRedis = flip evalStateT
