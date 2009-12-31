module Data.Geo.GPX.Accessor.Id where

import Data.Geo.GPX.Accessor.Accessor
import Prelude hiding (id)

class Id a where
  id :: a -> String
  setId :: String -> a -> a

  usingId :: a -> (String -> String) -> a
  usingId = id `using` setId
