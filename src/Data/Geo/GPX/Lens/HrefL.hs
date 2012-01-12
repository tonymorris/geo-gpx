module Data.Geo.GPX.Lens.HrefL where

import Data.Lens.Common

class HrefL a where
  hrefL :: Lens a String

