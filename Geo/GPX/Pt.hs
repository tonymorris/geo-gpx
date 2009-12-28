module Geo.GPX.Pt where

import Geo.GPX.Latitude
import Geo.GPX.Longitude

data Pt = Pt Latitude Longitude [Double] [String]
  deriving Eq

pt :: Latitude -> Longitude -> [Double] -> [String] -> Pt
pt = Pt
