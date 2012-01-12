module Data.Geo.GPX.Accessor.Rtes where

import Data.Geo.GPX.RteType
import Data.Geo.GPX.Accessor.Accessor

class Rtes a where
  rtes :: a -> [RteType]
  setRtes :: [RteType] -> a -> a

  setRtes' :: RteType -> a -> a
  setRtes' = setRtes . return

  usingRtes :: ([RteType] -> [RteType]) -> a -> a
  usingRtes = rtes `using` setRtes

  usingRtes' :: (RteType -> RteType) -> a -> a
  usingRtes' = usingRtes . fmap
