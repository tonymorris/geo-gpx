module Geo.GPX.Longitude where

import Data.Fixed
import Text.XML.HXT.Arrow

newtype Longitude = Longitude Double
  deriving Eq

longitude :: Double -> Longitude
longitude n = Longitude ((n + 180) `mod'` 360 - 180)

instance XmlPickler Longitude where
  xpickle = xpWrap (longitude, \(Longitude n) -> n) xpPrim

instance Show Longitude where
  show (Longitude n) = show n
