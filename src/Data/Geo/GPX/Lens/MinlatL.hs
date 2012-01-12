module Data.Geo.GPX.Lens.MinlatL where

import Data.Geo.GPX.Latitude
import Data.Lens.Common

class MinlatL a where
  minlatL :: Lens a Latitude

