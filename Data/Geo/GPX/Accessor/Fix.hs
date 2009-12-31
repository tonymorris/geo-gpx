module Data.Geo.GPX.Accessor.Fix where

import Data.Geo.GPX.FixType
import Data.Geo.GPX.Accessor.Accessor

class Fix a where
  fix :: a -> Maybe FixType
  setFix :: Maybe FixType -> a -> a

  setFix' :: FixType -> a -> a
  setFix' = setFix . Just

  usingFix :: a -> (Maybe FixType -> Maybe FixType) -> a
  usingFix = fix `using` setFix
