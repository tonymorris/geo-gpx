module Data.Geo.GPX.Accessor.Wpt where

import Data.Geo.GPX.WptType

class Wpt a where
  wpt :: a -> [WptType]
