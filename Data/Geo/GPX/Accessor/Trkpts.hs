module Data.Geo.GPX.Accessor.Trkpts where

import Data.Geo.GPX.WptType
import Data.Geo.GPX.Accessor.Accessor

class Trkpts a where
  trkpts :: a -> [WptType]
  setTrkpts :: [WptType] -> a -> a

  setTrkpts' :: WptType -> a -> a
  setTrkpts' = setTrkpts . return

  usingTrkpts :: ([WptType] -> [WptType]) -> a -> a
  usingTrkpts = trkpts `using` setTrkpts

  usingTrkpts' :: (WptType -> WptType) -> a -> a
  usingTrkpts' = usingTrkpts . fmap
