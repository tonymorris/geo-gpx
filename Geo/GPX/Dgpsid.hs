module Geo.GPX.Dgpsid where

newtype Dgpsid = Dgpsid Int
  deriving Eq

dgpsid :: Int -> Dgpsid
dgpsid n = if n >= 0 && n <= 1023 then Dgpsid n else error ("0 <= " ++ show n ++ " <= 1023")
