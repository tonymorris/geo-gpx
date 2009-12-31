module Data.Geo.GPX.Accessor.Creator where

import Data.Geo.GPX.Accessor.Accessor

class Creator a where
  creator :: a -> String
  setCreator :: String -> a -> a

  usingCreator :: a -> (String -> String) -> a
  usingCreator = creator `using` setCreator