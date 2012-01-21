module Data.Geo.GPX.Lens.TrksL where

import Data.Geo.GPX.Type.Trk
import Data.Lens.Common

class TrksL a where
  trksL :: Lens a [Trk]

