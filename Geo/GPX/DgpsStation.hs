module Geo.GPX.DgpsStation where

import Data.Ix

newtype DgpsStation = DgpsStation Int
  deriving Eq

dgpsStation :: Int -> DgpsStation
dgpsStation n = if inRange (0, 1023) n then DgpsStation n else error ("0 <= " ++ show n ++ " <= 1023")

instance Show DgpsStation where
  show (DgpsStation n) = show n
