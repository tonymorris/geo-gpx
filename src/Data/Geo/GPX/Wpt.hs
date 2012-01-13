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
import Data.Geo.GPX.Lens.LatL
import Data.Geo.GPX.Lens.LonL
import Data.Geo.GPX.Lens.EleL
import Data.Geo.GPX.Lens.TimeL
import Data.Geo.GPX.Lens.MagvarL
import Data.Geo.GPX.Lens.GeoidheightL
import Data.Geo.GPX.Lens.NameL
import Data.Geo.GPX.Lens.CmtL
import Data.Geo.GPX.Lens.DescL
import Data.Geo.GPX.Lens.SrcL
import Data.Geo.GPX.Lens.LinksL
import Data.Geo.GPX.Lens.SymL
import Data.Geo.GPX.Lens.TypeL
import Data.Geo.GPX.Lens.FixL
import Data.Geo.GPX.Lens.SatL
import Data.Geo.GPX.Lens.HdopL
import Data.Geo.GPX.Lens.VdopL
import Data.Geo.GPX.Lens.PdopL
import Data.Geo.GPX.Lens.AgeofdgpsdataL
import Data.Geo.GPX.Lens.DgpsidL
import Data.Geo.GPX.Lens.ExtensionsL
import Data.Lens.Common
import Control.Comonad.Trans.Store
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

instance LatL Wpt where
  latL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\lat -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) lat

instance LonL Wpt where
  lonL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\lon -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) lon

instance EleL Wpt where
  eleL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\ele -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) ele

instance TimeL Wpt where
  timeL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\time -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) time

instance MagvarL Wpt where
  magvarL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\magvar -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) magvar

instance GeoidheightL Wpt where
  geoidheightL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\geoidheight -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) geoidheight

instance NameL Wpt where
  nameL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\name -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) name

instance CmtL Wpt where
  cmtL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\cmt -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) cmt

instance DescL Wpt where
  descL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\desc -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) desc

instance SrcL Wpt where
  srcL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\src -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) src

instance LinksL Wpt where
  linksL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\links -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) links

instance SymL Wpt where
  symL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\sym -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) sym

instance TypeL Wpt where
  typeL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\typ -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) typ

instance FixL Wpt where
  fixL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\fix -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) fix

instance SatL Wpt where
  satL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\sat -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) sat

instance HdopL Wpt where
  hdopL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\hdop -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) hdop

instance VdopL Wpt where
  vdopL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\vdop -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) vdop

instance PdopL Wpt where
  pdopL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\pdop -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) pdop

instance AgeofdgpsdataL Wpt where
  ageofdgpsdataL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\ageofdgpsdata -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) ageofdgpsdata

instance DgpsidL Wpt where
  dgpsidL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\dgpsid -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) dgpsid

instance ExtensionsL Wpt where
  extensionsL =
    Lens $ \(Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) -> store (\extensions -> Wpt lat lon ele time magvar geoidheight name cmt desc src links sym typ fix sat hdop vdop pdop ageofdgpsdata dgpsid extensions) extensions

instance XmlPickler Wpt where
  xpickle =
    xpWrap (\(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u) -> wpt a b c d e f g h i j k l m n o p q r s t u,
           \(Wpt a b c d e f g h i j k l m n o p q r s t u) -> (a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u)) (xp21Tuple
              (xpAttr "lat" xpickle)
              (xpAttr "lon" xpickle)
              (xpOption (xpElem "ele" xpPrim))
              (xpOption (xpElem "time" (xpWrapMaybe (dateTime, show) xpText)))
              (xpOption (xpElem "magvar" xpickle))
              (xpOption (xpElem "geoidheight" xpPrim))
              (xpOption (xpElem "name" xpText))
              (xpOption (xpElem "cmt" xpText))
              (xpOption (xpElem "desc" xpText))
              (xpOption (xpElem "src" xpText))
              (xpList (xpElem "link" xpickle))
              (xpOption (xpElem "sym" xpText))
              (xpOption (xpElem "type" xpText))
              (xpOption (xpElem "fix" xpickle))
              (xpOption (xpElem "sat" xpPrim))
              (xpOption (xpElem "hdop" xpPrim))
              (xpOption (xpElem "vdop" xpPrim))
              (xpOption (xpElem "pdop" xpPrim))
              (xpOption (xpElem "ageofdgpsdata" xpPrim))
              (xpOption (xpElem "dgpsid" xpickle))
              (xpOption (xpElem "extensions" xpickle)))

