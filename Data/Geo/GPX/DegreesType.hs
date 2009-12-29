{-# LANGUAGE MultiParamTypeClasses #-}

-- | Simple Type: @degreesType@ <http://www.topografix.com/GPX/1/1/#type_degreesType>
module Data.Geo.GPX.DegreesType where

import Data.Geo.GPX.Accessor.Value
import Data.Fixed
import Text.XML.HXT.Arrow

newtype DegreesType = DegreesType Double
  deriving (Eq, Show)

degreesType :: Double -- ^ The value which will be between 0 and 360 (values out of the range are truncated using a modulus operation).
               -> DegreesType
degreesType n = DegreesType (n `mod'` 360)

instance XmlPickler DegreesType where
  xpickle = xpWrap (degreesType, \(DegreesType n) -> n) xpPrim

instance Value DegreesType Double where
  value (DegreesType x) = x
