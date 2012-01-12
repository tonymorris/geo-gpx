module Data.Geo.GPX.Accessor.Maxlon where

import Data.Geo.GPX.LongitudeType
import Data.Geo.GPX.Accessor.Accessor

class Maxlon a where
  maxlon :: a -> LongitudeType
  setMaxlon :: LongitudeType -> a -> a

  usingMaxlon :: (LongitudeType -> LongitudeType) -> a -> a
  usingMaxlon = maxlon `using` setMaxlon
