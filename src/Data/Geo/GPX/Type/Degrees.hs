{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses #-}

-- | Simple Type: @degreesType@ <http://www.topografix.com/GPX/1/1/#type_degreesType>
module Data.Geo.GPX.Type.Degrees(
  Degrees
, degrees
, runDegrees
) where


import Data.Fixed
import Control.Newtype
-- import Text.XML.HXT.Arrow.Pickle

newtype Degrees = Degrees Double
  deriving (Eq, Ord, Show)

degrees ::
  Double -- ^ The value which will be between 0 and 360 (values out of the range are truncated using a modulus operation).
  -> Degrees
degrees n =
  Degrees (n `mod'` 360)

runDegrees ::
  Degrees
  -> Double
runDegrees (Degrees d) =
  d
   {-
instance XmlPickler Degrees where
  xpickle =
    xpWrap (degrees, \(Degrees n) -> n) xpPrim
     -}

instance Newtype Degrees Double where
  pack = 
    degrees
  unpack (Degrees x) =
    x

