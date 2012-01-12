-- | Complex Type: @trkType@ <http://www.topografix.com/GPX/1/1/#type_trkType>
module Data.Geo.GPX.TrkType(
                             TrkType,
                             trkType
                           ) where

import Data.Geo.GPX.TrksegType
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
import Data.Geo.GPX.Accessor.Trksegs
import Data.Geo.GPX.Accessor.Trkpts
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras

data TrkType = TrkType (Maybe String) (Maybe String) (Maybe String) (Maybe String) [LinkType] (Maybe Int) (Maybe String) (Maybe ExtensionsType) [TrksegType]
  deriving (Eq, Show)

trkType :: Maybe String -- ^ The name.
           -> Maybe String -- ^ The cmt.
           -> Maybe String -- ^ The desc.
           -> Maybe String -- ^ The src.
           -> [LinkType] -- ^ The links (link).
           -> Maybe Int -- ^ The number.
           -> Maybe String -- ^ The type.
           -> Maybe ExtensionsType -- ^ The extensions.
           -> [TrksegType] -- ^ The track segments (trkseg).
           -> TrkType
trkType a b c d e f = TrkType a b c d e (fmap abs f)

instance XmlPickler TrkType where
  xpickle = xpWrap (\(a, b, c, d, e, f, g, h, i) -> trkType a b c d e f g h i, \(TrkType a b c d e f g h i) -> (a, b, c, d, e, f, g, h, i)) (xp9Tuple
              (xpOption (xpElem "name" xpText))
              (xpOption (xpElem "cmt" xpText))
              (xpOption (xpElem "desc" xpText))
              (xpOption (xpElem "src" xpText))
              (xpList (xpElem "link" xpickle))
              (xpOption (xpElem "number" xpPrim))
              (xpOption (xpElem "type" xpText))
              (xpOption (xpElem "extensions" xpickle))
              (xpList (xpElem "trkseg" xpickle)))

instance Name TrkType where
  name (TrkType x _ _ _ _ _ _ _ _) = x
  setName a (TrkType _ b c d e f g h i) = trkType a b c d e f g h i

instance Cmt TrkType where
  cmt (TrkType _ x _ _ _ _ _ _ _) = x
  setCmt b (TrkType a _ c d e f g h i) = trkType a b c d e f g h i

instance Desc TrkType where
  desc (TrkType _ _ x _ _ _ _ _ _) = x
  setDesc c (TrkType a b _ d e f g h i) = trkType a b c d e f g h i

instance Src TrkType where
  src (TrkType _ _ _ x _ _ _ _ _) = x
  setSrc d (TrkType a b c _ e f g h i) = trkType a b c d e f g h i

instance Links TrkType where
  links (TrkType _ _ _ _ x _ _ _ _) = x
  setLinks e (TrkType a b c d _ f g h i) = trkType a b c d e f g h i

instance Number TrkType where
  number (TrkType _ _ _ _ _ x _ _ _) = x
  setNumber f (TrkType a b c d e _ g h i) = trkType a b c d e f g h i

instance Type TrkType where
  type' (TrkType _ _ _ _ _ _ x _ _) = x
  setType g (TrkType a b c d e f _ h i) = trkType a b c d e f g h i

instance Extensions TrkType where
  extensions (TrkType _ _ _ _ _ _ _ x _) = x
  setExtensions h (TrkType a b c d e f g _ i) = trkType a b c d e f g h i

instance Trksegs TrkType where
  trksegs (TrkType _ _ _ _ _ _ _ _ x) = x
  setTrksegs i (TrkType a b c d e f g h _) = trkType a b c d e f g h i

instance Trkpts TrkType where
  trkpts = (trkpts =<<) . trksegs
  setTrkpts x (TrkType a b c d e f g h i) = trkType a b c d e f g h (fmap (setTrkpts x) i)

