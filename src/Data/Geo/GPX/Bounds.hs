-- | Complex Type: @boundsType@ <http://www.topografix.com/GPX/1/1/#type_boundsType>
module Data.Geo.GPX.Bounds(
  Bounds
, bounds
) where

import Data.Geo.GPX.Latitude
import Data.Geo.GPX.Longitude
import Text.XML.HXT.Arrow

data Bounds = Bounds (Latitude, Longitude) (Latitude, Longitude)
  deriving (Show, Eq)

bounds :: 
  (Latitude, Longitude) -- ^ The minimum latitude and longitude.
  -> (Latitude, Longitude) -- ^ The maximum latitude and longitude.
  -> Bounds
bounds =
  Bounds
  deriving (Eq, Ord)

