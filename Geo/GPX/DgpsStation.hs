module Geo.GPX.DgpsStation where

newtype DgpsStation = DgpsStation Int
  deriving Eq

dgpsStation :: Int -> DgpsStation
dgpsStation n = if n >= 0 && n <= 1023 then DgpsStation n else error ("0 <= " ++ show n ++ " <= 1023")
