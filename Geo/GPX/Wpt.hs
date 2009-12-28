module Geo.GPX.Wpt where

import Geo.GPX.Latitude
import Geo.GPX.Longitude
import Geo.GPX.Degrees
import Geo.GPX.Link
import Geo.GPX.Fix
import Geo.GPX.DgpsStation
import Geo.GPX.Extensions

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
               (Maybe Int)
               (Maybe Double)
               (Maybe Double)
               (Maybe Double)
               (Maybe Double)
               (Maybe DgpsStation)
               (Maybe Extensions)
  deriving Eq
