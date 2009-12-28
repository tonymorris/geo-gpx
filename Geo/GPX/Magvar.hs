module Geo.GPX.Magvar where

import Data.Fixed
import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

newtype Magvar = Magvar Double
  deriving Eq

magvar :: Double -> Magvar
magvar n = Magvar (n `mod'` 360)

instance XmlPickler Magvar where
  xpickle = xpElem "magvar" (xpWrap (magvar, \(Magvar n) -> n) xpPrim)

instance Show Magvar where
  show = showPickled []
