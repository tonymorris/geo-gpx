module Data.Geo.GPX.Accessor.Magvar where

import Data.Geo.GPX.DegreesType
import Data.Geo.GPX.Accessor.Accessor

class Magvar a where
  magvar :: a -> Maybe DegreesType
  setMagvar :: Maybe DegreesType -> a -> a

  setMagvar' :: DegreesType -> a -> a
  setMagvar' = setMagvar . Just

  usingMagvar :: (Maybe DegreesType -> Maybe DegreesType) -> a -> a
  usingMagvar = magvar `using` setMagvar

  usingMagvar' :: (DegreesType -> DegreesType) -> a -> a
  usingMagvar' = usingMagvar . fmap
