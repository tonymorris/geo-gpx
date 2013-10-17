{-# LANGUAGE GeneralizedNewtypeDeriving, FlexibleInstances, MultiParamTypeClasses #-}

-- | Simple Type: @latitudeType@ <http://www.topografix.com/GPX/1/1/#type_latitudeType>
module Data.Geo.Gpx.Latitude(
  Latitude
, latitude
, runLatitude
) where

import Data.Fixed

newtype Latitude = Latitude Double
  deriving (Eq, Ord, Enum, Num, Fractional, Floating, Real, RealFrac, RealFloat)

latitude ::
  Double -- ^ The value which will be between -90 and 90 (values out of the range are truncated using a modulus operation).
  -> Latitude
latitude n =
  Latitude ((n + 90) `mod'` 180 - 90)

runLatitude ::
  Latitude
  -> Double
runLatitude (Latitude d) =
  d

instance Show Latitude where
  show (Latitude n) = show n

{-
instance XmlPickler Latitude where
  xpickle = xpWrap (latitude, \(Latitude n) -> n) xpPrim
-}

{-
instance Newtype Latitude Double where
  pack = 
    latitude
  unpack (Latitude x) =
    x
-}
