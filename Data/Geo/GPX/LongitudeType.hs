module Data.Geo.GPX.LongitudeType where

import Data.Fixed
import Text.XML.HXT.Arrow

newtype LongitudeType = LongitudeType Double
  deriving Eq

longitudeType :: Double -> LongitudeType
longitudeType n = LongitudeType ((n + 180) `mod'` 360 - 180)

instance XmlPickler LongitudeType where
  xpickle = xpWrap (longitudeType, \(LongitudeType n) -> n) xpPrim

instance Show LongitudeType where
  show (LongitudeType n) = show n
