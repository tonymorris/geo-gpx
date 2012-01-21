module Data.Geo.GPX.Lens.MaxlatL where

import Data.Geo.GPX.Type.Latitude
import Data.Lens.Common

class MaxlatL a where
  maxlatL :: Lens a Latitude

