module Geo.GPX.Degrees where

import Data.Fixed
import Text.XML.HXT.Arrow

newtype Degrees = Degrees Double
  deriving (Eq, Show)

degrees :: Double -> Degrees
degrees n = Degrees (n `mod'` 360)

instance XmlPickler Degrees where
  xpickle = xpWrap (degrees, \(Degrees n) -> n) xpPrim
