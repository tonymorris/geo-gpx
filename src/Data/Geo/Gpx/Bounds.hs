-- | Complex Type: @boundsType@ <http://www.topografix.com/GPX/1/1/#type_boundsType>
module Data.Geo.Gpx.Bounds(
  Bounds
, bounds
) where

import Data.Geo.Gpx.Latitude
import Data.Geo.Gpx.Longitude

data Bounds = Bounds (Latitude, Longitude) (Latitude, Longitude)
  deriving (Eq, Ord)

bounds :: 
  (Latitude, Longitude) -- ^ The minimum latitude and longitude.
  -> (Latitude, Longitude) -- ^ The maximum latitude and longitude.
  -> Bounds
bounds =
  Bounds

{-
instance MinlatL Bounds where
  minlatL =
    Lens $ \(Bounds (minlat, minlon) (maxlat, maxlon)) -> store (\minlat -> Bounds (minlat, minlon) (maxlat, maxlon)) minlat

instance MinlonL Bounds where
  minlonL =
    Lens $ \(Bounds (minlat, minlon) (maxlat, maxlon)) -> store (\minlon -> Bounds (minlat, minlon) (maxlat, maxlon)) minlon

instance MaxlatL Bounds where
  maxlatL =
    Lens $ \(Bounds (minlat, minlon) (maxlat, maxlon)) -> store (\maxlat -> Bounds (minlat, minlon) (maxlat, maxlon)) maxlat

instance MaxlonL Bounds where
  maxlonL =
    Lens $ \(Bounds (minlat, minlon) (maxlat, maxlon)) -> store (\maxlon -> Bounds (minlat, minlon) (maxlat, maxlon)) maxlon
-}

{-
instance XmlPickler Bounds where
  xpickle =
    xpWrap (\(minlat', minlon', maxlat', maxlon') -> bounds (minlat', minlon') (maxlat', maxlon'),
            \(Bounds (minlat', minlon') (maxlat', maxlon')) -> (minlat', minlon', maxlat', maxlon')) (xp4Tuple
              (xpAttr "minlat" xpickle)
              (xpAttr "minlon" xpickle)
              (xpAttr "maxlat" xpickle)
              (xpAttr "maxlon" xpickle))
-}
