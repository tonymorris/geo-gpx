module Data.Geo.GPX.Accessor.Maxlat where

import Data.Geo.GPX.LatitudeType

class Maxlat a where
  maxlat :: a -> LatitudeType
  setMaxlat :: LatitudeType -> a -> a
