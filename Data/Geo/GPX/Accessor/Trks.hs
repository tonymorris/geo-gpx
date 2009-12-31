module Data.Geo.GPX.Accessor.Trks where

import Data.Geo.GPX.TrkType

class Trks a where
  trks :: a -> [TrkType]
  setTrks :: [TrkType] -> a -> a
