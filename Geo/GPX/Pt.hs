module Geo.GPX.Pt where

import Geo.GPX.Latitude
import Geo.GPX.Longitude
import Text.XML.HXT.Arrow

data Pt = Pt Latitude Longitude (Maybe Double) (Maybe String)
  deriving (Eq, Show)

pt :: Latitude -> Longitude -> (Maybe Double) -> (Maybe String) -> Pt
pt = Pt

instance XmlPickler Pt where
  xpickle = xpWrap (\(lat, lon, ele, time) -> pt lat lon ele time,
                   \(Pt lat lon ele time) -> (lat, lon, ele, time)) (xp4Tuple
                     (xpAttr "lat" xpickle)
                     (xpAttr "lon" xpickle)
                     (xpOption (xpElem "ele" xpPrim))
                     (xpOption (xpElem "time" xpText)))
