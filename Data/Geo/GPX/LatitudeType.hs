{-# LANGUAGE MultiParamTypeClasses #-}

-- | Simple Type: @latitudeType@ <http://www.topografix.com/GPX/1/1/#type_latitudeType>
module Data.Geo.GPX.LatitudeType where

import Data.Geo.GPX.Accessor.Value
import Data.Fixed
import Text.XML.HXT.Arrow

newtype LatitudeType = LatitudeType Double
  deriving Eq

latitudeType :: Double -- ^ The value which will be between -90 and 90 (values out of the range are truncated using a modulus operation).
                -> LatitudeType
latitudeType n = LatitudeType ((n + 90) `mod'` 180 - 90)

instance XmlPickler LatitudeType where
  xpickle = xpWrap (latitudeType, \(LatitudeType n) -> n) xpPrim

instance Show LatitudeType where
  show (LatitudeType n) = show n

instance Value LatitudeType Double where
  value (LatitudeType x) = x
