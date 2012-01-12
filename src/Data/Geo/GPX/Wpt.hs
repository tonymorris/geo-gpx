-- | Complex Type: @wptType@ <http://www.topografix.com/GPX/1/1/#type_wptType>
module Data.Geo.GPX.Wpt(
  Wpt
, wpt
, wpt'
) where

import Data.Geo.GPX.Latitude
import Data.Geo.GPX.Longitude
import Data.Geo.GPX.Degrees
import Data.Geo.GPX.Link
import Data.Geo.GPX.Fix
import Data.Geo.GPX.DgpsStation
import Data.Geo.GPX.Extensions
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras
import Text.XML.XSD.DateTime

data Wpt =
  Wpt
    Latitude
    Longitude
    (Maybe Double)
    (Maybe DateTime)
    (Maybe Degrees)
    (Maybe Double)
    (Maybe String)
    (Maybe String)
    (Maybe String)
    (Maybe String)
    [Link]
    (Maybe String)
    (Maybe String)
    (Maybe Fix)
    (Maybe Int)
    (Maybe Double)
    (Maybe Double)
    (Maybe Double)
    (Maybe Double)
    (Maybe DgpsStation)
    (Maybe Extensions)
  deriving (Eq, Ord)

wpt ::
  Latitude -- ^ The lat.
  -> Longitude -- ^ The lon.
  -> Maybe Double -- ^ The ele.
  -> Maybe DateTime -- ^ The time.
  -> Maybe Degrees -- ^ The magvar.
  -> Maybe Double -- ^ The geoidheight.
  -> Maybe String -- ^ The name.
  -> Maybe String -- ^ The cmt.
  -> Maybe String -- ^ The desc.
  -> Maybe String -- ^ The src.
  -> [Link] -- ^ The links (link).
  -> Maybe String -- ^ The sym.
  -> Maybe String -- ^ The type.
  -> Maybe Fix -- ^ The fix.
  -> Maybe Int -- ^ The sat.
  -> Maybe Double -- ^ The hdop.
  -> Maybe Double -- ^ The vdop.
  -> Maybe Double -- ^ The pdop.
  -> Maybe Double -- ^ The ageofdgpsdata.
  -> Maybe DgpsStation -- ^ The dgpsid.
  -> Maybe Extensions -- ^ The extensions.
  -> Wpt
wpt a b c d e f g h i j k l m n o p =
  Wpt a b c d e f g h i j k l m n o (fmap abs p)

-- | A waypoint with only a latitude and longitude.
wpt' ::
  Latitude -- ^ The lat.
  -> Longitude -- ^ The lon.
  -> Wpt
wpt' lat' lon' =
  wpt
    lat'
    lon'
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    []
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing

