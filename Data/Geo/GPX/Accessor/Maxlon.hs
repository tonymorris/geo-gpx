module Data.Geo.GPX.Accessor.Maxlon where

import Data.Geo.GPX.LongitudeType

class Maxlon a where
  maxlon :: a -> LongitudeType
  setMaxlon :: LongitudeType -> a -> a
--