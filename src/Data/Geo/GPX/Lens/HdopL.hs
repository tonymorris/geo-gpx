module Data.Geo.GPX.Lens.HdopL where

import Data.Lens.Common

class HdopL a where
  hdopL :: Lens a (Maybe Double)

