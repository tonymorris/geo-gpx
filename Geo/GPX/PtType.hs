module Geo.GPX.PtType where

import Geo.GPX.LatitudeType
import Geo.GPX.LongitudeType
import Text.XML.HXT.Arrow

data PtType = PtType LatitudeType LongitudeType (Maybe Double) (Maybe String)
  deriving (Eq, Show)

ptType :: LatitudeType -> LongitudeType -> (Maybe Double) -> (Maybe String) -> PtType
ptType = PtType

instance XmlPickler PtType where
  xpickle = xpWrap (\(lat, lon, ele, time) -> ptType lat lon ele time,
                   \(PtType lat lon ele time) -> (lat, lon, ele, time)) (xp4Tuple
                     (xpAttr "lat" xpickle)
                     (xpAttr "lon" xpickle)
                     (xpOption (xpElem "ele" xpPrim))
                     (xpOption (xpElem "time" xpText)))
