module Data.Geo.GPX.Lens.RtesL where

import Data.Geo.GPX.Type.Rte
import Data.Lens.Common

class RtesL a where
  rtesL :: Lens a [Rte]

