-- | Complex Type: @wptType@ <http://www.topografix.com/GPX/1/1/#type_wptType>
module Data.Geo.GPX.WptType(
                             WptType,
                             wptType
                           ) where

import Data.Geo.GPX.LatitudeType
import Data.Geo.GPX.LongitudeType
import Data.Geo.GPX.DegreesType
import Data.Geo.GPX.LinkType
import Data.Geo.GPX.FixType
import Data.Geo.GPX.DgpsStationType
import Data.Geo.GPX.ExtensionsType
import Data.Geo.GPX.Accessor.Lat
import Data.Geo.GPX.Accessor.Lon
import Data.Geo.GPX.Accessor.Ele
import Data.Geo.GPX.Accessor.Time
import Data.Geo.GPX.Accessor.Magvar
import Data.Geo.GPX.Accessor.Geoidheight
import Data.Geo.GPX.Accessor.Name
import Data.Geo.GPX.Accessor.Cmt
import Data.Geo.GPX.Accessor.Desc
import Data.Geo.GPX.Accessor.Src
import Data.Geo.GPX.Accessor.Links
import Data.Geo.GPX.Accessor.Sym
import Data.Geo.GPX.Accessor.Type
import Data.Geo.GPX.Accessor.Fix
import Data.Geo.GPX.Accessor.Sat
import Data.Geo.GPX.Accessor.Hdop
import Data.Geo.GPX.Accessor.Vdop
import Data.Geo.GPX.Accessor.Pdop
import Data.Geo.GPX.Accessor.Ageofdgpsdata
import Data.Geo.GPX.Accessor.Dgpsid
import Data.Geo.GPX.Accessor.Extensions
import Data.Geo.GPX.Accessor.Latlon
import Data.Geo.GPX.Accessor.Value
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras

data WptType = WptType LatitudeType
                       LongitudeType
                       (Maybe Double)
                       (Maybe String)
                       (Maybe DegreesType)
                       (Maybe Double)
                       (Maybe String)
                       (Maybe String)
                       (Maybe String)
                       (Maybe String)
                       [LinkType]
                       (Maybe String)
                       (Maybe String)
                       (Maybe FixType)
                       (Maybe Int)
                       (Maybe Double)
                       (Maybe Double)
                       (Maybe Double)
                       (Maybe Double)
                       (Maybe DgpsStationType)
                       (Maybe ExtensionsType)
  deriving (Eq, Show)

wptType :: LatitudeType -- ^ The lat.
           -> LongitudeType -- ^ The lon.
           -> Maybe Double -- ^ The ele.
           -> Maybe String -- ^ The time.
           -> Maybe DegreesType -- ^ The magvar.
           -> Maybe Double -- ^ The geoidheight.
           -> Maybe String -- ^ The name.
           -> Maybe String -- ^ The cmt.
           -> Maybe String -- ^ The desc.
           -> Maybe String -- ^ The src.
           -> [LinkType] -- ^ The links (link).
           -> Maybe String -- ^ The sym.
           -> Maybe String -- ^ The type.
           -> Maybe FixType -- ^ The fix.
           -> Maybe Int -- ^ The sat.
           -> Maybe Double -- ^ The hdop.
           -> Maybe Double -- ^ The vdop.
           -> Maybe Double -- ^ The pdop.
           -> Maybe Double -- ^ The ageofdgpsdata.
           -> Maybe DgpsStationType -- ^ The dgpsid.
           -> Maybe ExtensionsType -- ^ The extensions.
           -> WptType
wptType a b c d e f g h i j k l m n o p = WptType a b c d e f g h i j k l m n o (fmap abs p)

instance XmlPickler WptType where
  xpickle = xpWrap (\(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u) -> wptType a b c d e f g h i j k l m n o p q r s t u,
                   \(WptType a b c d e f g h i j k l m n o p q r s t u) -> (a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u)) (xp21Tuple
                    (xpAttr "lat" xpickle)
                    (xpAttr "lon" xpickle)
                    (xpOption (xpElem "ele" xpPrim))
                    (xpOption (xpElem "time" xpText))
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

instance Lat WptType where
  lat (WptType x _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x

instance Lon WptType where
  lon (WptType _ x _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x

instance Ele WptType where
  ele (WptType _ _ x _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x

instance Time WptType where
  time (WptType _ _ _ x _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x

instance Magvar WptType where
  magvar (WptType _ _ _ _ x _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x

instance Geoidheight WptType where
  geoidheight (WptType _ _ _ _ _ x _ _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x

instance Name WptType where
  name (WptType _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x

instance Cmt WptType where
  cmt (WptType _ _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _ _ _ _ _) = x

instance Desc WptType where
  desc (WptType _ _ _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _ _ _ _) = x

instance Src WptType where
  src (WptType _ _ _ _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _ _ _) = x

instance Links WptType where
  links (WptType _ _ _ _ _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _ _) = x

instance Sym WptType where
  sym (WptType _ _ _ _ _ _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _) = x

instance Type WptType where
  type' (WptType _ _ _ _ _ _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _) = x

instance Fix WptType where
  fix (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ x _ _ _ _ _ _ _) = x

instance Sat WptType where
  sat (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ x _ _ _ _ _ _) = x

instance Hdop WptType where
  hdop (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ x _ _ _ _ _) = x

instance Vdop WptType where
  vdop (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ x _ _ _ _) = x

instance Pdop WptType where
  pdop (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ x _ _ _) = x

instance Ageofdgpsdata WptType where
  ageofdgpsdata (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ x _ _) = x

instance Dgpsid WptType where
  dgpsid (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ x _) = x

instance Extensions WptType where
  extensions (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ x) = x

instance Latlon WptType where
  latlon e = (value (lat e), value (lon e))
