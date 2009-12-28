module Geo.GPX.Longitude where

import Data.Fixed
import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

newtype Longitude = Longitude Double
  deriving Eq

longitude :: Double -> Longitude
longitude n = Longitude ((n + 180) `mod'` 360 - 180)

instance XmlPickler Longitude where
  xpickle = undefined

instance Show Longitude where
  show = showPickled []
