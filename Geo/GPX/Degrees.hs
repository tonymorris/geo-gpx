module Geo.GPX.Degrees where

import Data.Fixed

newtype Degrees = Degrees Double
  deriving Eq

degrees :: Double -> Degrees
degrees n = Degrees (n `mod'` 360)

instance Show Degrees where
  show (Degrees d) = show d
