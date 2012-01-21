module Data.Geo.GPX.Lens.MagvarL where

import Data.Geo.GPX.Type.Degrees
import Data.Lens.Common

class MagvarL a where
  magvarL :: Lens a (Maybe Degrees)

