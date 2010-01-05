module Data.Geo.GPX.Accessor.Bounds where

import Data.Geo.GPX.BoundsType
import Data.Geo.GPX.Accessor.Accessor

class Bounds a where
  bounds :: a -> Maybe BoundsType
  setBounds :: Maybe BoundsType -> a -> a

  setBounds' :: BoundsType -> a -> a
  setBounds' = setBounds . Just

  usingBounds :: (Maybe BoundsType -> Maybe BoundsType) -> a -> a
  usingBounds = bounds `using` setBounds

  usingBounds' :: (BoundsType -> BoundsType) -> a -> a
  usingBounds' = usingBounds . fmap
