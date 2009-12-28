module Geo.GPX.Longitude where

import Data.Fixed

newtype Longitude = Longitude Double
  deriving Eq

longitude :: Double -> Longitude
longitude n = Longitude ((n + 180) `mod'` 360 - 180)
