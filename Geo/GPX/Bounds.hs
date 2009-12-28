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
  xpickle = undefined

instance Show Bounds where
  show = showPickled []
