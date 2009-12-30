-- | Complex Type: @rteType@ <http://www.topografix.com/GPX/1/1/#type_rteType>
module Data.Geo.GPX.RteType(
                             RteType,
                             rteType
                           ) where

import Data.Geo.GPX.WptType
import Data.Geo.GPX.ExtensionsType
import Data.Geo.GPX.LinkType
import Data.Geo.GPX.Accessor.Name
import Data.Geo.GPX.Accessor.Cmt
import Data.Geo.GPX.Accessor.Desc
import Data.Geo.GPX.Accessor.Src
import Data.Geo.GPX.Accessor.Links
import Data.Geo.GPX.Accessor.Number
import Data.Geo.GPX.Accessor.Type
import Data.Geo.GPX.Accessor.Extensions
import Data.Geo.GPX.Accessor.Rtepts
import Data.Geo.GPX.Accessor.Wpts
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras

data RteType = RteType (Maybe String) (Maybe String) (Maybe String) (Maybe String) [LinkType] (Maybe Int) (Maybe String) (Maybe ExtensionsType) [WptType]
  deriving (Eq, Show)

rteType :: Maybe String -- ^ The name.
           -> Maybe String -- ^ The cmt.
           -> Maybe String -- ^ The desc.
           -> Maybe String -- ^ The src.
           -> [LinkType] -- ^ The links (link).
           -> Maybe Int -- ^ The number.
           -> Maybe String -- ^ The type.
           -> Maybe ExtensionsType -- ^ The extensions.
           -> [WptType] -- ^ The route points (rtept).
           -> RteType
rteType a b c d e f = RteType a b c d e (fmap abs f)

instance XmlPickler RteType where
  xpickle = xpWrap (\(a, b, c, d, e, f, g, h, i) -> rteType a b c d e f g h i, \(RteType a b c d e f g h i) -> (a, b, c, d, e, f, g, h, i)) (xp9Tuple
              (xpOption (xpElem "name" xpText))
              (xpOption (xpElem "cmt" xpText))
              (xpOption (xpElem "desc" xpText))
              (xpOption (xpElem "src" xpText))
              (xpList (xpElem "link" xpickle))
              (xpOption (xpElem "number" xpPrim))
              (xpOption (xpElem "type" xpText))
              (xpOption (xpElem "extensions" xpickle))
              (xpList (xpElem "rtept" xpickle)))

instance Name RteType where
  name (RteType x _ _ _ _ _ _ _ _) = x

instance Cmt RteType where
  cmt (RteType _ x _ _ _ _ _ _ _) = x

instance Desc RteType where
  desc (RteType _ _ x _ _ _ _ _ _) = x

instance Src RteType where
  src (RteType _ _ _ x _ _ _ _ _) = x

instance Links RteType where
  links (RteType _ _ _ _ x _ _ _ _) = x

instance Number RteType where
  number (RteType _ _ _ _ _ x _ _ _) = x

instance Type RteType where
  type' (RteType _ _ _ _ _ _ x _ _) = x

instance Extensions RteType where
  extensions (RteType _ _ _ _ _ _ _ x _) = x

instance Rtepts RteType where
  rtepts (RteType _ _ _ _ _ _ _ _ x) = x

instance Wpts RteType where
  wpts = rtepts
