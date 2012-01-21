module Data.Geo.GPX.Lens.DgpsidL where

import Data.Geo.GPX.Type.DgpsStation
import Data.Lens.Common

class DgpsidL a where
  dgpsidL :: Lens a (Maybe DgpsStation)

