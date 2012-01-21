module Data.Geo.GPX.Lens.RteptsL where

import Data.Geo.GPX.Type.Wpt
import Data.Lens.Common

class RteptsL a where
  rteptsL :: Lens a [Wpt]

