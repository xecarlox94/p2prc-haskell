module Main where



import P2PRC
  ( runP2PRC
  , MapPortRequest(MkMapPortRequest)
  )

main :: IO ()
main = do
  runP2PRC
    ( MkMapPortRequest 8080 "jose.akilan.io"
    )

