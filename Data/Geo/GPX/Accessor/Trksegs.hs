module Data.Geo.GPX.Accessor.Trksegs where

import Data.Geo.GPX.TrksegType
import Data.Geo.GPX.Accessor.Accessor

class Trksegs a where
  trksegs :: a -> [TrksegType]
  setTrksegs :: [TrksegType] -> a -> a

  setTrksegs' :: TrksegType -> a -> a
  setTrksegs' = setTrksegs . return

  usingTrksegs :: a -> ([TrksegType] -> [TrksegType]) -> a
  usingTrksegs = trksegs `using` setTrksegs
