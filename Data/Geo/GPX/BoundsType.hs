module Data.Geo.GPX.BoundsType where

import Data.Geo.GPX.LatitudeType
import Data.Geo.GPX.LongitudeType
import Data.Geo.GPX.Accessor.Minlat
import Data.Geo.GPX.Accessor.Maxlat
import Data.Geo.GPX.Accessor.Minlon
import Data.Geo.GPX.Accessor.Maxlon
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

instance Minlat BoundsType where
  minlat (BoundsType (x, _) (_, _)) = x

instance Maxlat BoundsType where
  maxlat (BoundsType (_, _) (x, _)) = x

instance Minlon BoundsType where
  minlon (BoundsType (_, x) (_, _)) = x

instance Maxlon BoundsType where
  maxlon (BoundsType (_, _) (_, x)) = x
