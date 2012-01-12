module Data.Geo.GPX.Lens.PtsL where

import Data.Geo.GPX.Pt
import Data.Lens.Common

class PtsL a where
  ptsL :: Lens a [Pt]

