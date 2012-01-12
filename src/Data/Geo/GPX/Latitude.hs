{-# LANGUAGE MultiParamTypeClasses, GeneralizedNewtypeDeriving #-}

-- | Simple Type: @latitudeType@ <http://www.topografix.com/GPX/1/1/#type_latitudeType>
module Data.Geo.GPX.Latitude(
  Latitude
, latitude
) where

import Data.Fixed
import Text.XML.HXT.Arrow

newtype Latitude = Latitude Double
  deriving (Eq, Ord, Enum, Num, Fractional, Floating, Real, RealFrac, RealFloat)

latitude ::
  Double -- ^ The value which will be between -90 and 90 (values out of the range are truncated using a modulus operation).
  -> Latitude
latitude n =
  Latitude ((n + 90) `mod'` 180 - 90)

instance Show Latitude where
  show (Latitude n) = show n


