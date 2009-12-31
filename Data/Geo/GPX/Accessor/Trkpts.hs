module Data.Geo.GPX.Accessor.Trkpts where

import Data.Geo.GPX.WptType
import Data.Geo.GPX.Accessor.Accessor

class Trkpts a where
  trkpts :: a -> [WptType]
  setTrkpts :: [WptType] -> a -> a

  setTrkpts' :: WptType -> a -> a
  setTrkpts' = setTrkpts . return

  usingTrkpts :: a -> ([WptType] -> [WptType]) -> a
  usingTrkpts = trkpts `using` setTrkpts
