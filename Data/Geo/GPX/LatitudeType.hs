{-# LANGUAGE MultiParamTypeClasses #-}

module Data.Geo.GPX.LatitudeType where

import Data.Geo.GPX.Accessor.Value
import Data.Fixed
import Text.XML.HXT.Arrow

newtype LatitudeType = LatitudeType Double
  deriving Eq

latitudeType :: Double -> LatitudeType
latitudeType n = LatitudeType ((n + 90) `mod'` 180 - 90)

instance XmlPickler LatitudeType where
  xpickle = xpWrap (latitudeType, \(LatitudeType n) -> n) xpPrim

instance Show LatitudeType where
  show (LatitudeType n) = show n

instance Value LatitudeType Double where
  value (LatitudeType x) = x
