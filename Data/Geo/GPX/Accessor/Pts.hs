module Data.Geo.GPX.Accessor.Pts where

import Data.Geo.GPX.PtType
import Data.Geo.GPX.Accessor.Accessor

class Pts a where
  pts :: a -> [PtType]
  setPts :: [PtType] -> a -> a

  setPts' :: PtType -> a -> a
  setPts' = setPts . return

  usingPts :: ([PtType] -> [PtType]) -> a -> a
  usingPts = pts `using` setPts

  usingPts' :: (PtType -> PtType) -> a -> a
  usingPts' = usingPts . fmap
