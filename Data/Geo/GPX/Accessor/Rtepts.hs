module Data.Geo.GPX.Accessor.Rtepts where

import Data.Geo.GPX.WptType

class Rtepts a where
  rtepts :: a -> [WptType]
  setRtepts :: [WptType] -> a -> a
