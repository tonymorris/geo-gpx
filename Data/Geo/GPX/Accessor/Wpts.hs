module Data.Geo.GPX.Accessor.Wpts where

import Data.Geo.GPX.WptType
import Data.Geo.GPX.Accessor.Accessor

class Wpts a where
  wpts :: a -> [WptType]
  setWpts :: [WptType] -> a -> a

  setWpts' :: WptType -> a -> a
  setWpts' = setWpts . return

  usingWpts :: a -> ([WptType] -> [WptType]) -> a
  usingWpts = wpts `using` setWpts
