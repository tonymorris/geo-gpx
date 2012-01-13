{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- | Simple Type: @latitudeType@ <http://www.topografix.com/GPX/1/1/#type_latitudeType>
module Data.Geo.GPX.Longitude(
  Longitude
, longitude
, runLongitude
) where

import Data.Fixed
import Text.XML.HXT.Arrow.Pickle

newtype Longitude = Longitude Double
  deriving (Eq, Ord, Enum, Num, Fractional, Floating, Real, RealFrac, RealFloat)

longitude ::
  Double -- ^ The value which will be between -180 and 180 (values out of the range are truncated using a modulus operation).
  -> Longitude
longitude n =
  Longitude ((n + 180) `mod'` 360 - 180)

runLongitude ::
  Longitude
  -> Double
runLongitude (Longitude d) =
  d

instance Show Longitude where
  show (Longitude n) = show n

instance XmlPickler Longitude where
  xpickle = xpWrap (longitude, \(Longitude n) -> n) xpPrim

