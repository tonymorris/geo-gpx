module Geo.GPX.DgpsStation where

import Data.Ix

newtype DgpsStation = DgpsStation Int
  deriving Eq

dgpsStation :: Int -> DgpsStation
dgpsStation n = if n >= 0 && n <= 1023 then Dgpsid n else error ("0 <= " ++ show n ++ " <= 1023")

instance Show Dgpsid where
  show (DgpsStation n) = show n
