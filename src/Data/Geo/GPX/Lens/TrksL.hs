module Data.Geo.GPX.Lens.TrksL where

import Data.Geo.GPX.Trk
import Data.Lens.Common

class TrksL a where
  trksL :: Lens a [Trk]

