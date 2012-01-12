module Data.Geo.GPX.Lens.MinlonL where

import Data.Geo.GPX.Longitude
import Data.Lens.Common

class MinlonL a where
  minlonL :: Lens a Longitude

