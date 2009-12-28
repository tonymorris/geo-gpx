module Geo.GPX.Latitude where

import Data.Fixed

newtype Latitude = Latitude Double
  deriving Eq

latitude :: Double -> Latitude
latitude n = Latitude ((n + 90) `mod'` 180 - 90)
