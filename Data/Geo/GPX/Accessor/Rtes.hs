module Data.Geo.GPX.Accessor.Rtes where

import Data.Geo.GPX.RteType
import Data.Geo.GPX.Accessor.Accessor

class Rtes a where
  rtes :: a -> [RteType]
  setRtes :: [RteType] -> a -> a

  setRtes' :: RteType -> a -> a
  setRtes' = setRtes . return

  usingRtes :: a -> ([RteType] -> [RteType]) -> a
  usingRtes = rtes `using` setRtes
