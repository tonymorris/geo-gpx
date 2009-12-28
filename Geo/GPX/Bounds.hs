module Geo.GPX.Bounds where

import Geo.GPX.Latitude
import Geo.GPX.Longitude
import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

data Bounds = Bounds (Latitude, Longitude) (Latitude, Longitude)
  deriving Eq

bounds :: (Latitude, Longitude) -> (Latitude, Longitude) -> Bounds
bounds = Bounds

instance XmlPickler Bounds where
  xpickle = xpWrap (\(minlat, minlon, maxlat, maxlon) -> bounds (minlat, minlon) (maxlat, maxlon), \(Bounds (minlat, minlon) (maxlat, maxlon)) -> (minlat, minlon, maxlat, maxlon)) (xp4Tuple (xpAttr "minlat" xpickle) (xpAttr "minlon" xpickle) (xpAttr "maxlat" xpickle) (xpAttr "maxlon" xpickle))

instance Show Bounds where
  show = showPickled []
