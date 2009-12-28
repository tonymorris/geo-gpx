module Geo.GPX.Pt where

import Geo.GPX.Latitude
import Geo.GPX.Longitude
import Text.XML.HXT.Arrow

data Pt = Pt Latitude Longitude [Double] [String]
  deriving (Eq, Show)

pt :: Latitude -> Longitude -> [Double] -> [String] -> Pt
pt = Pt

instance XmlPickler Pt where
  xpickle = undefined
