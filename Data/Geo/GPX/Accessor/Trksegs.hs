module Data.Geo.GPX.Accessor.Trksegs where

import Data.Geo.GPX.TrksegType

class Trksegs a where
  trksegs :: a -> [TrksegType]
  setTrksegs :: [TrksegType] -> a -> a
