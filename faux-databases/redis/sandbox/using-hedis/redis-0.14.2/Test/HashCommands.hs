{-
Copyright (c) 2010-2011, Alexander Bogdanov <andorn@gmail.com>
License: MIT
-}

{-# LANGUAGE PackageImports #-}
module Test.HashCommands where

import Data.List
import Data.Map (Map(..), (!))
import qualified Data.Map as M
import qualified Data.Set as S
import Test.Setup hiding (sort)

tests = TList [TLabel "hgetall" test_hgetall,
               TLabel "hkeys" test_hkeys,
               TLabel "hvals" test_hvals,
               TLabel "hlen" test_hlen,
               TLabel "hexists, hset, hget and hdel" test_hexists_hset_hget_hdel,
               TLabel "hmset and hmget" test_hmset_hmget,
               TLabel "hincrBy" test_hincrBy,
               TLabel "variadic hdel" test_variadic_hdel,
               TLabel "hincrByFloat" test_hincrByFloat]

asHash :: Reply String -> IO (Map String String)
asHash r = fromRMultiBulk r >>= return . M.fromList . build . map fromJust . fromJust
    where build (a:b:z) = (a, b) : build z
          build (a:[]) = error "unpaired element"
          build [] = []

test_hgetall = TCase $ testRedis $
    let expected = M.fromList $ zip ["foo", "bar", "baz"] ["1", "2", "3"]
    in do r <- ask
          addHash
          liftIO $ do h <- hgetall r "hash" >>= asHash
                      assertEqual "" expected h
                      h <- hgetall r "no-such-key" >>= fromRMultiBulk :: IO (Maybe [Maybe String])
                      assertEqual "" (Just []) h

test_hkeys = TCase $ testRedis $
    do r <- ask
       addHash
       liftIO $ do h <- hgetall r "hash" >>= asHash
                   let expected = M.keys h
                   k <- hkeys r "hash" >>= fromRMultiBulk >>= return . sort . map fromJust . fromJust
                   assertEqual "" expected k
                   k <- hkeys r "no-such-key" >>= fromRMultiBulk :: IO (Maybe [Maybe String])
                   assertEqual "" (Just []) k

test_hvals = TCase $ testRedis $
    do r <- ask
       addHash
       liftIO $ do h <- hgetall r "hash" >>= asHash
                   let expected = S.fromList $ M.elems h -- Data.Set for order-independent equality
                   vals <- hvals r "hash" >>= fromRMultiBulk >>= return . S.fromList . map fromJust . fromJust
                   assertEqual "" expected vals
                   k <- hkeys r "no-such-key" >>= fromRMultiBulk :: IO (Maybe [Maybe String])
                   assertEqual "" (Just []) k

test_hlen = TCase $ testRedis $
    do r <- ask
       addHash
       liftIO $ do h <- hgetall r "hash" >>= asHash
                   l <- hlen r "hash" >>= fromRInt
                   assertEqual "" (M.size h) l
                   l <- hlen r "no-such-key" >>= fromRInt
                   assertEqual "" 0 l

test_hexists_hset_hget_hdel = TCase $ testRedis $
    do r <- ask
       addHash
       liftIO $ do hexists r "hash" "foo" >>= fromRInt >>= assertEqual "" 1
                   hexists r "hash" "jaz" >>= fromRInt >>= assertEqual "" 0
                   hdel r "hash" "foo" >>= fromRInt >>= assertEqual "" 1
                   hdel r "hash" "jaz" >>= fromRInt >>= assertEqual "" 0
                   hexists r "hash" "foo" >>= fromRInt >>= assertEqual "" 0
                   hset r "hash" "foo" "1" >>= fromRInt >>= assertEqual "" 1
                   hexists r "hash" "foo" >>= fromRInt >>= assertEqual "" 1
                   hset r "hash" "foo" "bar" >>= fromRInt >>= assertEqual "" 0
                   hget r "hash" "foo" >>= fromRBulk >>= assertEqual "" (Just "bar")
                   hget r "hash" "jaz" >>= fromRBulk >>= assertEqual "" (Nothing :: Maybe String)

test_hmset_hmget = TCase $ testRedis $
    do r <- ask
       addHash
       liftIO $ do h <- hgetall r "hash" >>= asHash
                   h' <- hmget r "hash" ["foo", "bar"] >>= fromRMultiBulk >>= return . map fromJust . fromJust
                   let h'' = M.fromList $ zip ["foo", "bar"] h'
                   assertEqual "" h (M.union h'' h)
                   hmset r "hash" [("foo", "foo"), ("bar", "bar")] >>= noError
                   let expected = M.update (const $ Just "foo") "foo" $ M.update (const $ Just "bar") "bar" h
                   h' <- hgetall r "hash" >>= asHash
                   assertEqual "" expected h'

test_hincrBy = TCase $ testRedis $
    do r <- ask
       addHash
       liftIO $ do h <- hgetall r "hash" >>= asHash >>= return . M.map read :: IO (Map String Int)
                   res <- hincrBy r "hash" "foo" 2 >>= fromRInt
                   assertEqual "" (h ! "foo" + 2) res
                   hget r "hash" "foo" >>= fromRBulk >>= assertEqual "" (Just res)
                   res <- hincrBy r "hash" "foo" (-2) >>= fromRInt
                   assertEqual "" (h ! "foo") res
                   hget r "hash" "foo" >>= fromRBulk >>= assertEqual "" (Just res)

test_variadic_hdel = TCase $ testRedis $
    do r <- ask
       addHash
       liftIO $ do res <- hdel_ r "hash" ["foo", "bar", "nope"] >>= fromRInt
                   assertEqual "2 fields deleted" 2 res
                   res <- hkeys r "hash" >>= fromRMultiBulk >>= return . fromJust
                   assertEqual "Only baz field remains" [Just "baz"] res
                   res <- hdel_ r "hash" ([] :: [String])
                   assertRError "Empty field list leads to error" res

test_hincrByFloat = TCase $ testRedis $
    do r <- ask
       addHash
       liftIO $ do h <- hgetall r "hash" >>= asHash >>= return . M.map read :: IO (Map String Double)
                   res <- hincrByFloat r "hash" "foo" 0.2 >>= fromRBulk >>= return . fromJust
                   assertEqual "" (h ! "foo" + 0.2) res
                   hget r "hash" "foo" >>= fromRBulk >>= assertEqual "" (Just res)
                   res <- hincrByFloat r "hash" "foo" (-0.2) >>= fromRBulk >>= return . fromJust
                   assertEqual "" (h ! "foo") res
                   hget r "hash" "foo" >>= fromRBulk >>= assertEqual "" (Just res)
