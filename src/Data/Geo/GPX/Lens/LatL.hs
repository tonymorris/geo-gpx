module Data.Geo.GPX.Lens.LatL where

import Data.Geo.GPX.Latitude
import Data.Lens.Common

class LatL a where
  latL :: Lens a Latitude

