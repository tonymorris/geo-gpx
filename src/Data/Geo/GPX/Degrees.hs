{-# LANGUAGE MultiParamTypeClasses #-}

-- | Simple Type: @degreesType@ <http://www.topografix.com/GPX/1/1/#type_degreesType>
module Data.Geo.GPX.Degrees(
  Degrees
, degrees
) where

import Data.Fixed
import Text.XML.HXT.Arrow

newtype Degrees = Degrees Double
  deriving (Eq, Ord)

degrees ::
  Double -- ^ The value which will be between 0 and 360 (values out of the range are truncated using a modulus operation).
  -> Degrees
degrees n =
  Degrees (n `mod'` 360)

