module Data.Geo.GPX.Lens.LonL where

import Data.Geo.GPX.Type.Longitude
import Data.Lens.Common

class LonL a where
  lonL :: Lens a Longitude

