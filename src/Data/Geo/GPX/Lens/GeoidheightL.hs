module Data.Geo.GPX.Lens.GeoidheightL where

import Data.Lens.Common

class GeoidheightL a where
  geoidheightL :: Lens a (Maybe Double)

