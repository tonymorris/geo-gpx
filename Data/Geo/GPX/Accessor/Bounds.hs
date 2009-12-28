module Data.Geo.GPX.Accessor.Bounds where

import Data.Geo.GPX.BoundsType

class Bounds a where
  bounds :: a -> Maybe BoundsType
