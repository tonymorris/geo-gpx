module Data.Geo.GPX.Accessor.Lat where

import Data.Geo.GPX.LatitudeType
import Data.Geo.GPX.Accessor.Accessor

class Lat a where
  lat :: a -> LatitudeType
  setLat :: LatitudeType -> a -> a

  usingLat :: a -> (LatitudeType -> LatitudeType) -> a
  usingLat = lat `using` setLat
