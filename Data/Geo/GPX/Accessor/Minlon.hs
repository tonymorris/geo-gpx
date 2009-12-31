module Data.Geo.GPX.Accessor.Minlon where

import Data.Geo.GPX.LongitudeType
import Data.Geo.GPX.Accessor.Accessor

class Minlon a where
  minlon :: a -> LongitudeType
  setMinlon :: LongitudeType -> a -> a

  usingMinlon :: a -> (LongitudeType -> LongitudeType) -> a
  usingMinlon = minlon `using` setMinlon
