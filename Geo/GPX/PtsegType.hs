module Geo.GPX.PtsegType where

import Geo.GPX.PtType
import Text.XML.HXT.Arrow

newtype PtsegType = PtsegType [PtType]
  deriving (Eq, Show)

ptsegType :: [PtType] -> PtsegType
ptsegType = PtsegType

instance XmlPickler PtsegType where
  xpickle = xpWrap (ptsegType, \(PtsegType k) -> k) (xpList (xpElem "pt" xpickle))

