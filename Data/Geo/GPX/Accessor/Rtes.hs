module Data.Geo.GPX.Accessor.Rtes where

import Data.Geo.GPX.RteType

class Rtes a where
  rtes :: a -> [RteType]
  setRtes :: [RteType] -> a -> a
