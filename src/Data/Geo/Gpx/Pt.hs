-- | Complex Type: @ptType@ <http://www.topografix.com/GPX/1/1/#type_ptType>
module Data.Geo.Gpx.Pt(
  Pt
, pt
) where

import Data.Geo.Gpx.Latitude
import Data.Geo.Gpx.Longitude
import Text.XML.XSD.DateTime

data Pt = Pt Latitude Longitude (Maybe Double) (Maybe DateTime)
  deriving Eq

pt ::
  Latitude -- ^ The lat.
  -> Longitude -- ^ The lon.
  -> Maybe Double -- ^ The ele.
  -> Maybe DateTime -- ^ The time.
  -> Pt
pt =
  Pt

{-
instance LatL Pt where
  latL =
    Lens $ \(Pt lat lon ele time) -> store (\lat -> Pt lat lon ele time) lat

instance LonL Pt where
  lonL =
    Lens $ \(Pt lat lon ele time) -> store (\lon -> Pt lat lon ele time) lon

instance EleL Pt where
  eleL =
    Lens $ \(Pt lat lon ele time) -> store (\ele -> Pt lat lon ele time) ele

instance TimeL Pt where
  timeL =
    Lens $ \(Pt lat lon ele time) -> store (\time -> Pt lat lon ele time) time
-}

{-
instance XmlPickler Pt where
  xpickle =
    xpWrap (\(lat', lon', ele', time') -> pt lat' lon' ele' time',
           \(Pt lat' lon' ele' time') -> (lat', lon', ele', time')) (xp4Tuple
             (xpAttr "lat" xpickle)
             (xpAttr "lon" xpickle)
             (xpOption (xpElem "ele" xpPrim))
             (xpOption (xpElem "time" (xpWrapMaybe (dateTime, show) xpText))))
-}
