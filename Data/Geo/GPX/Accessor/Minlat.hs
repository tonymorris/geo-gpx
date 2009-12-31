module Data.Geo.GPX.Accessor.Minlat where

import Data.Geo.GPX.LatitudeType
import Data.Geo.GPX.Accessor.Accessor

class Minlat a where
  minlat :: a -> LatitudeType
  setMinlat :: LatitudeType -> a -> a

  usingMinlat :: a -> (LatitudeType -> LatitudeType) -> a
  usingMinlat = minlat `using` setMinlat
