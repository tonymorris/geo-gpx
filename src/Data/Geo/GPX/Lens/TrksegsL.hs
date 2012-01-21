module Data.Geo.GPX.Lens.TrksegsL where

import Data.Geo.GPX.Type.Trkseg
import Data.Lens.Common

class TrksegsL a where
  trksegsL :: Lens a [Trkseg]

