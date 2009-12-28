module Geo.GPX.Wpt where

import Geo.GPX.Latitude
import Geo.GPX.Longitude
import Geo.GPX.Degrees
import Geo.GPX.Link

data Wpt = Wpt Latitude
               Longitude
               (Maybe Double)
               (Maybe Degrees)
               (Maybe Double)
               (Maybe String)
               (Maybe String)
               (Maybe String)
               (Maybe String)
               [Link]
               (Maybe String)
               (Maybe String)
               (Maybe Fix)
  deriving Eq
