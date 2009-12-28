module Data.Geo.GPX.Accessor.Fix where

import Data.Geo.GPX.FixType

class Fix a where
  fix :: a -> Maybe FixType
