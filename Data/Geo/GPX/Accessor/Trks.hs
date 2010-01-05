module Data.Geo.GPX.Accessor.Trks where

import Data.Geo.GPX.TrkType
import Data.Geo.GPX.Accessor.Accessor

class Trks a where
  trks :: a -> [TrkType]
  setTrks :: [TrkType] -> a -> a

  setTrks' :: TrkType -> a -> a
  setTrks' = setTrks . return

  usingTrks :: ([TrkType] -> [TrkType]) -> a -> a
  usingTrks = trks `using` setTrks

  usingTrks' :: (TrkType -> TrkType) -> a -> a
  usingTrks' = usingTrks . fmap
