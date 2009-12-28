module Data.Geo.GPX.Accessor.Minlat where

import Data.Geo.GPX.LatitudeType

class Minlat a where
  minlat :: a -> LatitudeType
