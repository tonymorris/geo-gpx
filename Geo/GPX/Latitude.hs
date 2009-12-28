module Geo.GPX.Latitude where

import Data.Fixed
import Text.XML.HXT.Arrow

newtype Latitude = Latitude Double
  deriving Eq

latitude :: Double -> Latitude
latitude n = Latitude ((n + 90) `mod'` 180 - 90)

instance XmlPickler Latitude where
  xpickle = xpWrap (latitude, \(Latitude n) -> n) xpPrim

instance Show Latitude where
  show (Latitude n) = show n
