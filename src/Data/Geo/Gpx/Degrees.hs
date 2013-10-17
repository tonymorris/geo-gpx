-- | Simple Type: @degreesType@ <http://www.topografix.com/GPX/1/1/#type_degreesType>
module Data.Geo.Gpx.Degrees(
  Degrees
, degrees
, xpDegrees
) where

import Text.XML.HXT.Core
import Control.Lens

newtype Degrees =
 Degrees Double deriving (Eq, Ord, Show)

degrees ::
  Prism' Double Degrees -- ^ A prism to a value which will be between 0 and 360.
degrees =
  prism'
    (\(Degrees d) -> d)
    (\d -> if d >= 0 && d <= 360 then Just (Degrees d) else Nothing)

xpDegrees ::
  PU Degrees
xpDegrees =
  xpWrapMaybe ((^? degrees), (#) degrees) xpPrim

instance XmlPickler Degrees where
  xpickle =
    xpDegrees
