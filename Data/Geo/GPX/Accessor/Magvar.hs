module Data.Geo.GPX.Accessor.Magvar where

import Data.Geo.GPX.DegreesType
import Data.Geo.GPX.Accessor.Accessor

class Magvar a where
  magvar :: a -> Maybe DegreesType
  setMagvar :: Maybe DegreesType -> a -> a

  setMagvar' :: DegreesType -> a -> a
  setMagvar' = setMagvar . Just

  usingMagvar :: a -> (Maybe DegreesType -> Maybe DegreesType) -> a
  usingMagvar = magvar `using` setMagvar
