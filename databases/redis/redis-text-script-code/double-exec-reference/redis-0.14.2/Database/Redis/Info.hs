{-
Copyright (c) 2010-2011, Alexander Bogdanov <andorn@gmail.com>
License: MIT
-}

module Database.Redis.Info (
    RedisInfo, parseInfo
) where

import Data.Map (Map(..), fromList)
import Data.Char

type RedisInfo = Map String String

parseInfo :: String -> RedisInfo
parseInfo = fromList . parsePairs . filterComments . filterEmptyLines . lines

filterEmptyLines :: [String] -> [String]
filterEmptyLines = filter $ not . all isSpace

startsWith :: Char -> String -> Bool
startsWith c (s:ls) | c == s = True
                    | isSpace s = startsWith c ls
                    | otherwise = False
startsWith _ _ = False

trim = takeWhile (not . isSpace) . dropWhile isSpace

filterComments :: [String] -> [String]
filterComments = filter $ not . startsWith '#'

parsePairs :: [String] -> [(String, String)]
parsePairs = map parsePair
    where parsePair ls = let (a, b) = break (== ':') ls
                         in (a, trim $ tail b)
