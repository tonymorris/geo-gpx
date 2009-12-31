module Data.Geo.GPX.Accessor.Trkpts where

import Data.Geo.GPX.WptType

class Trkpts a where
  trkpts :: a -> [WptType]
  setTrkpts :: [WptType] -> a -> a
