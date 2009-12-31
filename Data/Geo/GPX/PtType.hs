-- | Complex Type: @ptType@ <http://www.topografix.com/GPX/1/1/#type_ptType>
module Data.Geo.GPX.PtType(
                            PtType,
                            ptType
                          ) where

import Data.Geo.GPX.LatitudeType
import Data.Geo.GPX.LongitudeType
import Data.Geo.GPX.Accessor.Lat
import Data.Geo.GPX.Accessor.Lon
import Data.Geo.GPX.Accessor.Ele
import Data.Geo.GPX.Accessor.Time
import Text.XML.HXT.Arrow
import Text.XML.XSD.DateTime

data PtType = PtType LatitudeType LongitudeType (Maybe Double) (Maybe DateTime)
  deriving (Eq, Show)

ptType :: LatitudeType -- ^ The lat.
          -> LongitudeType -- ^ The lon.
          -> Maybe Double -- ^ The ele.
          -> Maybe DateTime -- ^ The time.
          -> PtType
ptType = PtType

instance XmlPickler PtType where
  xpickle = xpWrap (\(lat', lon', ele', time') -> ptType lat' lon' ele' time',
                   \(PtType lat' lon' ele' time') -> (lat', lon', ele', time')) (xp4Tuple
                     (xpAttr "lat" xpickle)
                     (xpAttr "lon" xpickle)
                     (xpOption (xpElem "ele" xpPrim))
                     (xpOption (xpElem "time" (xpWrapMaybe (dateTime, show) xpText))))

instance Lat PtType where
  lat (PtType x _ _ _) = x
  setLat a (PtType _ b c d) = ptType a b c d

instance Lon PtType where
  lon (PtType _ x _ _) = x
  setLon b (PtType a _ c d) = ptType a b c d

instance Ele PtType where
  ele (PtType _ _ x _) = x
  setEle c (PtType a b _ d) = ptType a b c d

instance Time PtType where
  time (PtType _ _ _ x) = x
  setTime d (PtType a b c _) = ptType a b c d
