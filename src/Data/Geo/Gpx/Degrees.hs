-- | Simple Type: @degreesType@ <http://www.topografix.com/GPX/1/1/#type_degreesType>
module Data.Geo.Gpx.Degrees(
  Degrees
, degrees
, xpMagvarElem
, xpDegrees
) where

import Text.XML.HXT.Core
import Control.Lens

-- $setup
-- >>> let unpickleMagvarElem = fmap (unpickleDoc' xpMagvarElem) . runLA xread
-- >>> let allUnpickledMagvarElem = all (either (const False) (const True) . unpickleDoc' xpMagvarElem) . runLA xread

newtype Degrees =
  Degrees Double deriving (Eq, Ord, Show)

degrees ::
  Prism' Double Degrees -- ^ A prism to a value which will be between 0 and 360.
degrees =
  prism'
    (\(Degrees d) -> d)
    (\d -> if d >= 0 && d <= 360 then Just (Degrees d) else Nothing)

-- | Pickler for the @magvar@ element.
--
-- >>> unpickleMagvarElem "<magvar>0</magvar>"
-- [Right (Degrees 0.0)]
--
-- >>> unpickleMagvarElem "<magvar>3</magvar>"
-- [Right (Degrees 3.0)]
--
-- >>> unpickleMagvarElem "<magvar>0.1</magvar>"
-- [Right (Degrees 0.1)]
--
-- >>> unpickleMagvarElem "<magvar>359.9</magvar>"
-- [Right (Degrees 359.9)]
--
-- >>> unpickleMagvarElem "<magvar>360</magvar>"
-- [Right (Degrees 360.0)]
--
-- >>> allUnpickledMagvarElem "<magvar>-0.1</magvar>"
-- False
--
-- >>> allUnpickledMagvarElem "<magvar>361</magvar>"
-- False
xpMagvarElem ::
  PU Degrees
xpMagvarElem =
  xpElem "magvar"
    xpDegrees

-- | Pickler for the @Degrees@ type.
xpDegrees ::
  PU Degrees
xpDegrees =
  xpWrapMaybe ((^? degrees), (#) degrees) xpPrim

instance XmlPickler Degrees where
  xpickle =
    xpDegrees
