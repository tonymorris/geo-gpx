module Data.Geo.GPX.Accessor.Wpts where

import Data.Geo.GPX.WptType

class Wpts a where
  wpts :: a -> [WptType]
  setWpts :: [WptType] -> a -> a
