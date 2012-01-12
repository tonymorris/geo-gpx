module Data.Geo.GPX.Accessor.Version where

import Data.Geo.GPX.Accessor.Accessor

class Version a where
  version :: a -> String
  setVersion :: String -> a -> a

  usingVersion :: (String -> String) -> a -> a
  usingVersion = version `using` setVersion
