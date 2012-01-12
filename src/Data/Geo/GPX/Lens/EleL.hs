module Data.Geo.GPX.Lens.EleL where

import Data.Lens.Common

class EleL a where
  eleL :: Lens a (Maybe Double)

