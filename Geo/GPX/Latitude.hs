module Geo.GPX.Latitude where

import Data.Fixed

newtype Latitude = Latitude Double
  deriving Eq

latitude :: Double -> Latitude
latitude n = Latitude ((n + 90) `mod'` 180 - 90)

instance Show Latitude where
  show (Latitude n) = show n
