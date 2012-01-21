module Data.Geo.GPX.Lens.MinlatL where

import Data.Geo.GPX.Type.Latitude
import Data.Lens.Common

class MinlatL a where
  minlatL :: Lens a Latitude

