module Data.Geo.GPX.Lens.MaxlonL where

import Data.Geo.GPX.Type.Longitude
import Data.Lens.Common

class MaxlonL a where
  maxlonL :: Lens a Longitude

