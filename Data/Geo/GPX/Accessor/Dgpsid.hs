module Data.Geo.GPX.Accessor.Dgpsid where

import Data.Geo.GPX.DgpsStationType
import Data.Geo.GPX.Accessor.Accessor

class Dgpsid a where
  dgpsid :: a -> Maybe DgpsStationType
  setDgpsid :: Maybe DgpsStationType -> a -> a

  setDgpsid' :: DgpsStationType -> a -> a
  setDgpsid' = setDgpsid . Just

  usingDgpsid :: (Maybe DgpsStationType -> Maybe DgpsStationType) -> a -> a
  usingDgpsid = dgpsid `using` setDgpsid

  usingDgpsid' :: (DgpsStationType -> DgpsStationType) -> a -> a
  usingDgpsid' = usingDgpsid . fmap
