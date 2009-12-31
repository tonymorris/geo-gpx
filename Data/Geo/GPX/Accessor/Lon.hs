module Data.Geo.GPX.Accessor.Lon where

import Data.Geo.GPX.LongitudeType

class Lon a where
  lon :: a -> LongitudeType
  setLon :: LongitudeType -> a -> a
