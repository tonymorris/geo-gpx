module Geo.GPX.Trkseg where

import Geo.GPX.Wpt
import Geo.GPX.Extensions

data Trkseg = Trkseg [Wpt] (Maybe Extensions)
  deriving Eq

trkseg :: [Wpt] -> Maybe Extensions -> Trkseg
trkseg = Trkseg
