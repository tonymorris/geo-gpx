module Data.Geo.GPX.PtType where

import Data.Geo.GPX.LatitudeType
import Data.Geo.GPX.LongitudeType
import Data.Geo.GPX.Accessor.Lat
import Data.Geo.GPX.Accessor.Lon
import Data.Geo.GPX.Accessor.Ele
import Data.Geo.GPX.Accessor.Time
import Text.XML.HXT.Arrow

data PtType = PtType LatitudeType LongitudeType (Maybe Double) (Maybe String)
  deriving (Eq, Show)

ptType :: LatitudeType -> LongitudeType -> (Maybe Double) -> (Maybe String) -> PtType
ptType = PtType

instance XmlPickler PtType where
  xpickle = xpWrap (\(lat', lon', ele', time') -> ptType lat' lon' ele' time',
                   \(PtType lat' lon' ele' time') -> (lat', lon', ele', time')) (xp4Tuple
                     (xpAttr "lat" xpickle)
                     (xpAttr "lon" xpickle)
                     (xpOption (xpElem "ele" xpPrim))
                     (xpOption (xpElem "time" xpText)))

instance Lat PtType where
  lat (PtType x _ _ _) = x

instance Lon PtType where
  lon (PtType _ x _ _) = x

instance Ele PtType where
  ele (PtType _ _ x _) = x

instance Time PtType where
  time (PtType _ _ _ x) = x
