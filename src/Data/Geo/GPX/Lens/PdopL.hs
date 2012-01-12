module Data.Geo.GPX.Lens.PdopL where

import Data.Lens.Common

class PdopL a where
  pdopL :: Lens a (Maybe Double)

