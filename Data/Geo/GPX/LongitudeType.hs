{-# LANGUAGE MultiParamTypeClasses #-}

-- | Simple Type: @latitudeType@ <http://www.topografix.com/GPX/1/1/#type_latitudeType>
module Data.Geo.GPX.LongitudeType where

import Data.Geo.GPX.Accessor.Value
import Data.Fixed
import Text.XML.HXT.Arrow

newtype LongitudeType = LongitudeType Double
  deriving Eq

longitudeType :: Double -- ^ The value which will be between -180 and 180 (values out of the range are truncated using a modulus operation).
                 -> LongitudeType
longitudeType n = LongitudeType ((n + 180) `mod'` 360 - 180)

instance XmlPickler LongitudeType where
  xpickle = xpWrap (longitudeType, \(LongitudeType n) -> n) xpPrim

instance Show LongitudeType where
  show (LongitudeType n) = show n

instance Value LongitudeType Double where
  value (LongitudeType x) = x
