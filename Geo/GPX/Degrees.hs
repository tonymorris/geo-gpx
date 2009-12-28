module Geo.GPX.Degrees where

import Data.Fixed
import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

newtype Degrees = Degrees Double
  deriving Eq

degrees :: Double -> Degrees
degrees n = Degrees (n `mod'` 360)

instance XmlPickler Degrees where
  xpickle = xpElem "degrees" (xpWrap (degrees, \(Degrees n) -> n) xpPrim)

instance Show Degrees where
  show = showPickled []
