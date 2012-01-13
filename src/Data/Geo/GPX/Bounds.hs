-- | Complex Type: @boundsType@ <http://www.topografix.com/GPX/1/1/#type_boundsType>
module Data.Geo.GPX.Bounds(
  Bounds
, bounds
) where

import Data.Geo.GPX.Latitude
import Data.Geo.GPX.Longitude
import Data.Geo.GPX.Lens.MinlatL
import Data.Geo.GPX.Lens.MaxlatL
import Data.Geo.GPX.Lens.MinlonL
import Data.Geo.GPX.Lens.MaxlonL
import Data.Lens.Common
import Control.Comonad.Trans.Store
import Text.XML.HXT.Arrow

data Bounds = Bounds (Latitude, Longitude) (Latitude, Longitude)
  deriving (Eq, Ord)

bounds :: 
  (Latitude, Longitude) -- ^ The minimum latitude and longitude.
  -> (Latitude, Longitude) -- ^ The maximum latitude and longitude.
  -> Bounds
bounds =
  Bounds

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

instance XmlPickler Bounds where
  xpickle =
    xpWrap (\(minlat', minlon', maxlat', maxlon') -> bounds (minlat', minlon') (maxlat', maxlon'),
            \(Bounds (minlat', minlon') (maxlat', maxlon')) -> (minlat', minlon', maxlat', maxlon')) (xp4Tuple
              (xpAttr "minlat" xpickle)
              (xpAttr "minlon" xpickle)
              (xpAttr "maxlat" xpickle)
              (xpAttr "maxlon" xpickle))

