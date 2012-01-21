module Data.Geo.GPX.Lens.WptsL where

import Data.Geo.GPX.Type.Wpt
import Data.Lens.Common

class WptsL a where
  wptsL :: Lens a [Wpt]

