{-# LANGUAGE ForeignFunctionInterface #-}
module Main where

-- foreign export ccall helloFromHaskell :: IO ()

import Foreign.C.String
import Foreign.Marshal.Alloc

foreign import ccall "" go_StrFxn :: CString -> IO CString

-- | Custom function to make CString-based FFI functions user-friendly.
runStrFxn :: (CString -> IO CString) -> String -> IO String
runStrFxn f input = do
  cinput <- newCString input
  coutput <- f cinput
  res <- peekCString coutput
  _ <- free cinput
  _ <- free coutput
  return res

-- main :: String -> IO String
main = do
    runStrFxn go_StrFxn "lol1"
-- main = putStrLn runStrFxn go_StrFxn
-- main = putStrLn "Hello, Haskell!"
