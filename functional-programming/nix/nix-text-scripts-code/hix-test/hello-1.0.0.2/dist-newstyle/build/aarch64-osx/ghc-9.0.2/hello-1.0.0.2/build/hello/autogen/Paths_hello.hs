{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_hello (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0,0,2] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/sirbeerus/.cabal/bin"
libdir     = "/Users/sirbeerus/.cabal/lib/aarch64-osx-ghc-9.0.2/hello-1.0.0.2-inplace"
dynlibdir  = "/Users/sirbeerus/.cabal/lib/aarch64-osx-ghc-9.0.2"
datadir    = "/Users/sirbeerus/.cabal/share/aarch64-osx-ghc-9.0.2/hello-1.0.0.2"
libexecdir = "/Users/sirbeerus/.cabal/libexec/aarch64-osx-ghc-9.0.2/hello-1.0.0.2"
sysconfdir = "/Users/sirbeerus/.cabal/etc"

getBinDir     = catchIO (getEnv "hello_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "hello_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "hello_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "hello_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hello_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hello_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
