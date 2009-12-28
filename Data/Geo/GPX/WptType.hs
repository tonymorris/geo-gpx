module Data.Geo.GPX.WptType where

import Data.Geo.GPX.LatitudeType
import Data.Geo.GPX.LongitudeType
import Data.Geo.GPX.DegreesType
import Data.Geo.GPX.LinkType
import Data.Geo.GPX.FixType
import Data.Geo.GPX.DgpsStationType
import Data.Geo.GPX.ExtensionsType
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

wptType :: LatitudeType
           -> LongitudeType
           -> Maybe Double
           -> Maybe String
           -> Maybe DegreesType
           -> Maybe Double
           -> Maybe String
           -> Maybe String
           -> Maybe String
           -> Maybe String
           -> [LinkType]
           -> Maybe String
           -> Maybe String
           -> Maybe FixType
           -> Maybe Int
           -> Maybe Double
           -> Maybe Double
           -> Maybe Double
           -> Maybe Double
           -> Maybe DgpsStationType
           -> Maybe ExtensionsType
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
