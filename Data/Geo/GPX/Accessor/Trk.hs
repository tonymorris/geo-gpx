module Data.Geo.GPX.Accessor.Trk where

import Data.Geo.GPX.TrkType

class Trk a where
  trk :: a -> [TrkType]
