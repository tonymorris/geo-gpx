module Geo.GPX.DgpsStation where

import Data.Ix
import Text.XML.HXT.Arrow

newtype DgpsStation = DgpsStation Int
  deriving Eq

dgpsStation :: Int -> DgpsStation
dgpsStation n = if inRange (0, 1023) n then DgpsStation n else error ("0 <= " ++ show n ++ " <= 1023")

instance Show DgpsStation where
  show (DgpsStation n) = show n

instance XmlPickler DgpsStation where
  xpickle = xpWrapMaybe (\n -> if inRange (0, 1023) n then Just (dgpsStation n) else Nothing, \(DgpsStation n) -> n) xpickle
