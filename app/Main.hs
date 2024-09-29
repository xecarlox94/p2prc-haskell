{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE CApiFFI #-}

module Main where

-- foreign export ccall helloFromHaskell :: IO ()

import Foreign.C.String
import Foreign.Marshal.Alloc
import Control.Concurrent

foreign import capi "p2prc.h Init" go_Init :: CString -> IO CString
foreign import capi "p2prc.h Server" go_Server :: CString -> IO CString
foreign import capi "p2prc.h MapPort" go_MapPort :: CString -> IO CString
foreign import capi "p2prc.h GetSpecs" go_GetSpecs :: CString -> IO CString
-- foreign import capi "p2prc.h StartContainer" go_StartContainer ::  CString ->CString -> IO CString
-- foreign import capi "p2prc.h RemoveContainer" go_RemoveContainer :: CString -> IO CString


-- | Custom function to make CString-based FFI functions user-friendly.
runStrFxn :: (CString -> IO CString) -> String -> IO String
runStrFxn f input = do
  cinput <- newCString input
  coutput <- f cinput
  res <- peekCString coutput
  _ <- free cinput
  _ <- free coutput
  return res

-- Testing library functions
-- main :: IO ()
-- main = do
--     res1 <- runStrFxn go_Init ""
--     -- putStrLn res1
--     res <- runStrFxn go_Server ""
--     putStrLn res
--     threadDelay 1000000
--     -- portAddr <- newCString "22"
--     res1 <- runStrFxn go_GetSpecs "217.76.63.222:8078"
--     -- _ <- free portAddr
--     putStrLn res1
--     -- threadDelay 1000000

--     putStrLn "END"

-- main = putStrLn runStrFxn go_StrFxn
-- main = putStrLn "Hello, Haskell!"
