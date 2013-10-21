{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}

-- | Complex Type: @boundsType@ <http://www.topografix.com/GPX/1/1/#type_boundsType>
module Data.Geo.Gpx.Bounds(
  Bounds
, xpBoundsElem
, xpBounds
, bounds
, minlat
, minlon
, maxlat
, maxlon
) where

import Data.Geo.Gpx.Latitude(Latitude)
import Data.Geo.Gpx.Longitude(Longitude)
import Text.XML.HXT.Core(XmlPickler(..), PU, xpWrap, xp4Tuple, xpElem, xpAttr)
import Control.Lens(makeClassy)
import Prelude(Eq, Ord, Show)

-- $setup
-- >>> import Prelude
-- >>> import Text.XML.HXT.Core
-- >>> let unpickleBoundsElem = fmap (unpickleDoc' xpBoundsElem) . runLA xread
-- >>> let allUnpickledBoundsElem = all (either (const False) (const True) . unpickleDoc' xpBoundsElem) . runLA xread

data Bounds =
  Bounds {
    _minlat ::
      Latitude
  , _minlon ::
      Longitude
  , _maxlat ::
      Latitude
  , _maxlon ::
      Longitude
  } deriving (Eq, Ord, Show)

makeClassy ''Bounds

-- | Pickler for the @bounds@ element.
--
-- >>> unpickleBoundsElem "<bounds minlat=\"10\" minlon=\"100\" maxlat=\"-10\" maxlon=\"-100\"/>"
-- [Right (Bounds {_minlat = Latitude 10.0, _minlon = Longitude 100.0, _maxlat = Latitude (-10.0), _maxlon = Longitude (-100.0)})]
xpBoundsElem ::
  PU Bounds
xpBoundsElem =
  xpElem "bounds"
    xpBounds

-- | Pickler for the @Bounds@ type.
xpBounds ::
  PU Bounds
xpBounds =
  xpWrap (\(minlat', minlon', maxlat', maxlon') -> Bounds minlat' minlon' maxlat' maxlon',
              \(Bounds minlat' minlon' maxlat' maxlon') -> (minlat', minlon', maxlat', maxlon')) (xp4Tuple
                (xpAttr "minlat" xpickle)
                (xpAttr "minlon" xpickle)
                (xpAttr "maxlat" xpickle)
                (xpAttr "maxlon" xpickle))

instance XmlPickler Bounds where
  xpickle =
    xpBounds
