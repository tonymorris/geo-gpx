module Data.Geo.GPX.Lens.VdopL where

import Data.Lens.Common

class VdopL a where
  vdopL :: Lens a (Maybe Double)

