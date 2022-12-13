{-
Copyright (c) 2010-2011, Alexander Bogdanov <andorn@gmail.com>
License: MIT
-}

-- | Same as "Database.Redis.Utils.Lock" but with monadic wrapped
module Database.Redis.Utils.Monad.Lock (acquire, acquire', acquireOnce, release) where

import Control.Monad.Trans
import qualified Database.Redis.Utils.Lock as L
import Database.Redis.Monad (WithRedis(..))
import Database.Redis.ByteStringClass

acquire :: (WithRedis m, BS s) => s -> Int -> Int -> m Bool
acquire name timeout retry_timeout =
    do r <- getRedis
       liftIO $ L.acquire r name timeout retry_timeout

acquire' name timeout = acquire name timeout 1

acquireOnce name = getRedis >>= liftIO . flip L.acquireOnce name

release :: (WithRedis m, BS s) => s -> m ()
release name = getRedis >>= liftIO . flip L.release name
