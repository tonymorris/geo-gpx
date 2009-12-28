module Data.Geo.GPX.Accessor.Minlon where

import Data.Geo.GPX.LongitudeType

class Minlon a where
  minlon :: a -> LongitudeType
