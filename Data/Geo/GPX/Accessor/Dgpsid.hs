module Data.Geo.GPX.Accessor.Dgpsid where

import Data.Geo.GPX.DgpsStationType

class Dgpsid a where
  dgpsid :: a -> Maybe DgpsStationType
