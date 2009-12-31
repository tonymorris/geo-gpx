module Data.Geo.GPX.Accessor.Lat where

import Data.Geo.GPX.LatitudeType

class Lat a where
  lat :: a -> LatitudeType
  setLat :: LatitudeType -> a -> a
