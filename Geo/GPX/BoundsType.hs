module Geo.GPX.BoundsType where

import Geo.GPX.LatitudeType
import Geo.GPX.LongitudeType
import Text.XML.HXT.Arrow

data BoundsType = BoundsType (LatitudeType, LongitudeType) (LatitudeType, LongitudeType)
  deriving (Show, Eq)

boundsType :: (LatitudeType, LongitudeType) -> (LatitudeType, LongitudeType) -> BoundsType
boundsType = BoundsType

instance XmlPickler BoundsType where
  xpickle = xpWrap (\(minlat, minlon, maxlat, maxlon) -> boundsType (minlat, minlon) (maxlat, maxlon),
                    \(BoundsType (minlat, minlon) (maxlat, maxlon)) -> (minlat, minlon, maxlat, maxlon)) (xp4Tuple
                      (xpAttr "minlat" xpickle)
                      (xpAttr "minlon" xpickle)
                      (xpAttr "maxlat" xpickle)
                      (xpAttr "maxlon" xpickle))
