module Data.Geo.GPX.Accessor.Rte where

import Data.Geo.GPX.RteType

class Rte a where
  rte :: a -> [RteType]
