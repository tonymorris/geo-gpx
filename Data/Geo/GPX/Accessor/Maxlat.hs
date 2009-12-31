module Data.Geo.GPX.Accessor.Maxlat where

import Data.Geo.GPX.LatitudeType
import Data.Geo.GPX.Accessor.Accessor

class Maxlat a where
  maxlat :: a -> LatitudeType
  setMaxlat :: LatitudeType -> a -> a

  usingMaxlat :: a -> (LatitudeType -> LatitudeType) -> a
  usingMaxlat = maxlat `using` setMaxlat
