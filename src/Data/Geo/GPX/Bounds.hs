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
    Lens $ \(Bounds (a, b) (c, d)) -> store (\a -> Bounds (a, b) (c, d)) a

instance MinlonL Bounds where
  minlonL =
    Lens $ \(Bounds (a, b) (c, d)) -> store (\b -> Bounds (a, b) (c, d)) b

instance MaxlatL Bounds where
  maxlatL =
    Lens $ \(Bounds (a, b) (c, d)) -> store (\c -> Bounds (a, b) (c, d)) c

instance MaxlonL Bounds where
  maxlonL =
    Lens $ \(Bounds (a, b) (c, d)) -> store (\d -> Bounds (a, b) (c, d)) d

