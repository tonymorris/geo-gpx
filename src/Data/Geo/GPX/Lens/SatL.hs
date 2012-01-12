module Data.Geo.GPX.Lens.SatL where

import Data.Lens.Common

class SatL a where
  satL :: Lens a (Maybe Int)

