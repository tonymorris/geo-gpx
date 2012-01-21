module Data.Geo.GPX.Lens.PtsL where

import Data.Geo.GPX.Type.Pt
import Data.Lens.Common

class PtsL a where
  ptsL :: Lens a [Pt]

