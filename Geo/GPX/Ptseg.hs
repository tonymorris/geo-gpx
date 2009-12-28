module Geo.GPX.Ptseg where

import Geo.GPX.Pt

newtype Ptseg = Ptseg [Pt]
  deriving Eq

ptseg :: [Pt] -> Ptseg
ptseg = Ptseg
