module Geo.GPX.Gpx where

import Geo.GPX.Metadata
import Geo.GPX.Wpt
import Geo.GPX.Rte
import Geo.GPX.Trk
import Geo.GPX.Extensions
import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

data Gpx = Gpx String (Maybe Metadata) [Wpt] [Rte] [Trk] (Maybe Extensions)
  deriving Eq

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

instance Show Gpx where
  show = showPickled []
