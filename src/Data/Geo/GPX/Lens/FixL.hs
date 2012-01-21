module Data.Geo.GPX.Lens.FixL where

import Data.Geo.GPX.Type.Fix
import Data.Lens.Common

class FixL a where
  fixL :: Lens a (Maybe Fix)

