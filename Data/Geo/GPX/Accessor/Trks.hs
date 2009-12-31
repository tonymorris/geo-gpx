module Data.Geo.GPX.Accessor.Trks where

import Data.Geo.GPX.TrkType
import Data.Geo.GPX.Accessor.Accessor

class Trks a where
  trks :: a -> [TrkType]
  setTrks :: [TrkType] -> a -> a

  setTrks' :: TrkType -> a -> a
  setTrks' = setTrks . return

  usingTrks :: a -> ([TrkType] -> [TrkType]) -> a
  usingTrks = trks `using` setTrks
