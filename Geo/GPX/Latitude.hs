module Geo.GPX.Latitude where

import Data.Fixed
import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

newtype Latitude = Latitude Double
  deriving Eq

latitude :: Double -> Latitude
latitude n = Latitude ((n + 90) `mod'` 180 - 90)

instance XmlPickler Latitude where
  xpickle = undefined

instance Show Latitude where
  show = showPickled []
