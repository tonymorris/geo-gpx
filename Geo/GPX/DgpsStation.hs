module Geo.GPX.DgpsStation where

import Data.Ix
import Text.XML.HXT.Arrow

newtype DgpsStation = DgpsStation Int
  deriving Eq

dgpsStation :: Int -> Maybe DgpsStation
dgpsStation n = if inRange (0, 1023) n then Just (DgpsStation n) else Nothing

instance Show DgpsStation where
  show (DgpsStation n) = show n

instance XmlPickler DgpsStation where
  xpickle = xpWrapMaybe (dgpsStation, \(DgpsStation n) -> n) xpickle
