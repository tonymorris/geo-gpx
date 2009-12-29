-- | Complex Type: @ptsegType@ <http://www.topografix.com/GPX/1/1/#type_ptsegType>
module Data.Geo.GPX.PtsegType where

import Data.Geo.GPX.PtType
import Data.Geo.GPX.Accessor.Pts
import Text.XML.HXT.Arrow

newtype PtsegType = PtsegType [PtType]
  deriving (Eq, Show)

ptsegType :: [PtType] -- ^ The points (pt).
             -> PtsegType
ptsegType = PtsegType

instance XmlPickler PtsegType where
  xpickle = xpWrap (ptsegType, \(PtsegType k) -> k) (xpList (xpElem "pt" xpickle))

instance Pts PtsegType where
  pts (PtsegType x) = x
