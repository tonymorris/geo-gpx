module Geo.GPX.Bounds where

import Geo.GPX.Latitude
import Geo.GPX.Longitude

data Bounds = Bounds (Latitude, Longitude) (Latitude, Longitude)
  deriving Eq

bounds :: (Latitude, Longitude) -> (Latitude, Longitude) -> Bounds
bounds = Bounds
