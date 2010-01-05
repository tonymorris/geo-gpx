module Data.Geo.GPX.Accessor.Fix where

import Data.Geo.GPX.FixType
import Data.Geo.GPX.Accessor.Accessor

class Fix a where
  fix :: a -> Maybe FixType
  setFix :: Maybe FixType -> a -> a

  setFix' :: FixType -> a -> a
  setFix' = setFix . Just

  usingFix :: (Maybe FixType -> Maybe FixType) -> a -> a
  usingFix = fix `using` setFix

  usingFix' :: (FixType -> FixType) -> a -> a
  usingFix' = usingFix . fmap
