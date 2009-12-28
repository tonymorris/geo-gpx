module Geo.GPX.Ptseg where

import Geo.GPX.Pt
import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

newtype Ptseg = Ptseg [Pt]
  deriving Eq

ptseg :: [Pt] -> Ptseg
ptseg = Ptseg

instance XmlPickler Ptseg where
  xpickle = undefined

instance Show Ptseg where
  show = showPickled []
