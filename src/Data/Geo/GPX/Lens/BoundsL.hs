module Data.Geo.GPX.Lens.BoundsL where

import Data.Geo.GPX.Type.Bounds
import Data.Lens.Common

class BoundsL a where
  boundsL :: Lens a (Maybe Bounds)

