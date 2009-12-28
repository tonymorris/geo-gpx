module Geo.GPX.Ptseg where

import Geo.GPX.Pt
import Text.XML.HXT.Arrow

newtype Ptseg = Ptseg [Pt]
  deriving (Eq, Show)

ptseg :: [Pt] -> Ptseg
ptseg = Ptseg

instance XmlPickler Ptseg where
  xpickle = undefined

