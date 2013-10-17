-- | Simple Type: @dgpsStationType@ <http://www.topografix.com/GPX/1/1/#type_dgpsStationType>
module Data.Geo.Gpx.DgpsStation(
  DgpsStation
, dgpsStation
, runDgpsStation
) where

import Data.Ix
-- import Text.XML.HXT.Arrow.Pickle

newtype DgpsStation = DgpsStation Int
  deriving (Eq, Ord)

dgpsStation ::
  Int -- ^ The value between 0 and 1023.
  -> Maybe DgpsStation
dgpsStation n =
  if inRange (0, 1023) n
    then
      Just (DgpsStation n)
    else
      Nothing

runDgpsStation ::
  DgpsStation
  -> Int
runDgpsStation (DgpsStation i) =
  i

{-
instance XmlPickler DgpsStation where
  xpickle =
    xpWrapMaybe (dgpsStation, \(DgpsStation n) -> n) xpickle
-}
