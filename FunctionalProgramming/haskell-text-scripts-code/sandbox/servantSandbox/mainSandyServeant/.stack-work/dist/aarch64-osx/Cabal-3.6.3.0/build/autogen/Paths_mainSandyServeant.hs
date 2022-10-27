{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_mainSandyServeant (
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
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/sirbeerus/Dropbox/Mac/Documents/Programming/FunctionalProgramming/haskell_Text_Scripts_Code/Sandbox/servantSandbox/mainSandyServeant/.stack-work/install/aarch64-osx/a8e93230ed590e32d2c7cdd3f30771d8347e67539ee4d70240f0121945ea3633/9.2.4/bin"
libdir     = "/Users/sirbeerus/Dropbox/Mac/Documents/Programming/FunctionalProgramming/haskell_Text_Scripts_Code/Sandbox/servantSandbox/mainSandyServeant/.stack-work/install/aarch64-osx/a8e93230ed590e32d2c7cdd3f30771d8347e67539ee4d70240f0121945ea3633/9.2.4/lib/aarch64-osx-ghc-9.2.4/mainSandyServeant-0.1.0.0-3b3POR9m6Pt8I8EgXgfAIb"
dynlibdir  = "/Users/sirbeerus/Dropbox/Mac/Documents/Programming/FunctionalProgramming/haskell_Text_Scripts_Code/Sandbox/servantSandbox/mainSandyServeant/.stack-work/install/aarch64-osx/a8e93230ed590e32d2c7cdd3f30771d8347e67539ee4d70240f0121945ea3633/9.2.4/lib/aarch64-osx-ghc-9.2.4"
datadir    = "/Users/sirbeerus/Dropbox/Mac/Documents/Programming/FunctionalProgramming/haskell_Text_Scripts_Code/Sandbox/servantSandbox/mainSandyServeant/.stack-work/install/aarch64-osx/a8e93230ed590e32d2c7cdd3f30771d8347e67539ee4d70240f0121945ea3633/9.2.4/share/aarch64-osx-ghc-9.2.4/mainSandyServeant-0.1.0.0"
libexecdir = "/Users/sirbeerus/Dropbox/Mac/Documents/Programming/FunctionalProgramming/haskell_Text_Scripts_Code/Sandbox/servantSandbox/mainSandyServeant/.stack-work/install/aarch64-osx/a8e93230ed590e32d2c7cdd3f30771d8347e67539ee4d70240f0121945ea3633/9.2.4/libexec/aarch64-osx-ghc-9.2.4/mainSandyServeant-0.1.0.0"
sysconfdir = "/Users/sirbeerus/Dropbox/Mac/Documents/Programming/FunctionalProgramming/haskell_Text_Scripts_Code/Sandbox/servantSandbox/mainSandyServeant/.stack-work/install/aarch64-osx/a8e93230ed590e32d2c7cdd3f30771d8347e67539ee4d70240f0121945ea3633/9.2.4/etc"

getBinDir     = catchIO (getEnv "mainSandyServeant_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "mainSandyServeant_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "mainSandyServeant_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "mainSandyServeant_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "mainSandyServeant_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "mainSandyServeant_sysconfdir") (\_ -> return sysconfdir)




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
