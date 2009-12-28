module Geo.GPX.Gpx where

import Geo.GPX.Metadata
import Geo.GPX.Wpt
import Geo.GPX.Rte
import Geo.GPX.Trk
import Geo.GPX.Extensions
import Text.XML.HXT.Arrow

data Gpx = Gpx String (Maybe Metadata) [Wpt] [Rte] [Trk] (Maybe Extensions)
  deriving (Eq, Show)

gpx :: String
    -> Maybe Metadata
    -> [Wpt]
    -> [Rte]
    -> [Trk]
    -> Maybe Extensions
    -> Gpx
gpx = Gpx

instance XmlPickler Gpx where
  xpickle = undefined
