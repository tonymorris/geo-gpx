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
import Text.XML.XSD.DateTime

data WptType = WptType LatitudeType
                       LongitudeType
                       (Maybe Double)
                       (Maybe DateTime)
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
           -> Maybe DateTime -- ^ The time.
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

instance Lat WptType where
  lat (WptType x _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x
  setLat a (WptType _ b c d e f g h i j k l m n o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Lon WptType where
  lon (WptType _ x _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x
  setLon b (WptType a _ c d e f g h i j k l m n o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Ele WptType where
  ele (WptType _ _ x _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x
  setEle c (WptType a b _ d e f g h i j k l m n o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Time WptType where
  time (WptType _ _ _ x _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x
  setTime d (WptType a b c _ e f g h i j k l m n o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Magvar WptType where
  magvar (WptType _ _ _ _ x _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x
  setMagvar e (WptType a b c d _ f g h i j k l m n o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Geoidheight WptType where
  geoidheight (WptType _ _ _ _ _ x _ _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x
  setGeoidheight f (WptType a b c d e _ g h i j k l m n o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Name WptType where
  name (WptType _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _ _ _ _ _ _) = x
  setName g (WptType a b c d e f _ h i j k l m n o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Cmt WptType where
  cmt (WptType _ _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _ _ _ _ _) = x
  setCmt h (WptType a b c d e f g _ i j k l m n o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Desc WptType where
  desc (WptType _ _ _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _ _ _ _) = x
  setDesc i (WptType a b c d e f g h _ j k l m n o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Src WptType where
  src (WptType _ _ _ _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _ _ _) = x
  setSrc j (WptType a b c d e f g h i _ k l m n o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Links WptType where
  links (WptType _ _ _ _ _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _ _) = x
  setLinks k (WptType a b c d e f g h i j _ l m n o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Sym WptType where
  sym (WptType _ _ _ _ _ _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _) = x
  setSym l (WptType a b c d e f g h i j k _ m n o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Type WptType where
  type' (WptType _ _ _ _ _ _ _ _ _ _ _ x _ _ _ _ _ _ _ _ _) = x
  setType m (WptType a b c d e f g h i j k l _ n o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Fix WptType where
  fix (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ x _ _ _ _ _ _ _) = x
  setFix n (WptType a b c d e f g h i j k l m _ o p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Sat WptType where
  sat (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ x _ _ _ _ _ _) = x
  setSat o (WptType a b c d e f g h i j k l m n _ p q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Hdop WptType where
  hdop (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ x _ _ _ _ _) = x
  setHdop p (WptType a b c d e f g h i j k l m n o _ q r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Vdop WptType where
  vdop (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ x _ _ _ _) = x
  setVdop q (WptType a b c d e f g h i j k l m n o p _ r s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Pdop WptType where
  pdop (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ x _ _ _) = x
  setPdop r (WptType a b c d e f g h i j k l m n o p q _ s t u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Ageofdgpsdata WptType where
  ageofdgpsdata (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ x _ _) = x
  setAgeofdgpsdata s (WptType a b c d e f g h i j k l m n o p q r _ t u) = wptType a b c d e f g h i j k l m n o p q r s t u
--
instance Dgpsid WptType where
  dgpsid (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ x _) = x
  setDgpsid t (WptType a b c d e f g h i j k l m n o p q r s _ u) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Extensions WptType where
  extensions (WptType _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ x) = x
  setExtensions u (WptType a b c d e f g h i j k l m n o p q r s t _) = wptType a b c d e f g h i j k l m n o p q r s t u

instance Latlon WptType where
  latlon e = (value (lat e), value (lon e))
  setLatlon (a, b) (WptType _ _ c d e f g h i j k l m n o p q r s t u) = wptType (latitudeType a) (longitudeType b) c d e f g h i j k l m n o p q r s t u
