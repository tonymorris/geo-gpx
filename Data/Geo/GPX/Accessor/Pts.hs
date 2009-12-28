module Data.Geo.GPX.Accessor.Pts where

import Data.Geo.GPX.PtType

class Pts a where
  pts :: a -> [PtType]
