module Data.Geo.GPX.Lens.MagvarL where

import Data.Geo.GPX.Degrees
import Data.Lens.Common

class MagvarL a where
  magvarL :: Lens a (Maybe Degrees)

