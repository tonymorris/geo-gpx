module Geo.GPX.Trkseg where

import Geo.GPX.Wpt
import Geo.GPX.Extensions
import Text.XML.HXT.Arrow

data Trkseg = Trkseg [Wpt] (Maybe Extensions)
  deriving (Eq, Show)

trkseg :: [Wpt] -> Maybe Extensions -> Trkseg
trkseg = Trkseg

instance XmlPickler Trkseg where
  xpickle = undefined
