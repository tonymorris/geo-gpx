module Data.Geo.GPX.Accessor.Lat where

import Data.Geo.GPX.LatitudeType
import Data.Geo.GPX.Accessor.Accessor

class Lat a where
  lat :: a -> LatitudeType
  setLat :: LatitudeType -> a -> a

  usingLat :: (LatitudeType -> LatitudeType) -> a -> a
  usingLat = lat `using` setLat
