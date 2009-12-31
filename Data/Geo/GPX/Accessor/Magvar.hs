module Data.Geo.GPX.Accessor.Magvar where

import Data.Geo.GPX.DegreesType

class Magvar a where
  magvar :: a -> Maybe DegreesType
  setMagvar :: Maybe DegreesType -> a -> a
