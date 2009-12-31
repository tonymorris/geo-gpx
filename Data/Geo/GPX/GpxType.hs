{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances  #-}

-- | Complex Type: @gpxType@ <http://www.topografix.com/GPX/1/1/#type_gpxType>
module Data.Geo.GPX.GpxType(
                             GpxType,
                             gpxType
                           ) where

import Data.Geo.GPX.MetadataType
import Data.Geo.GPX.WptType
import Data.Geo.GPX.RteType
import Data.Geo.GPX.TrkType
import Data.Geo.GPX.ExtensionsType
import Data.Geo.GPX.PersonType
import Data.Geo.GPX.Accessor.Version
import Data.Geo.GPX.Accessor.Creator
import Data.Geo.GPX.Accessor.Metadata
import Data.Geo.GPX.Accessor.Wpts
import Data.Geo.GPX.Accessor.Rtes
import Data.Geo.GPX.Accessor.Trks
import Data.Geo.GPX.Accessor.Extensions
import Data.Geo.GPX.Accessor.Name
import Data.Geo.GPX.Accessor.Desc
import Data.Geo.GPX.Accessor.Author
import Data.Geo.GPX.Accessor.Copyright
import Data.Geo.GPX.Accessor.Links
import Data.Geo.GPX.Accessor.Time
import Data.Geo.GPX.Accessor.Keywords
import Data.Geo.GPX.Accessor.Bounds
import Data.Geo.GPX.Accessor.Rtepts
import Data.Geo.GPX.Accessor.Trkpts
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras
import Data.Maybe

data GpxType = GpxType String String (Maybe MetadataType) [WptType] [RteType] [TrkType] (Maybe ExtensionsType)
  deriving (Eq, Show)

gpxType :: String -- ^ The version.
           -> String -- ^ The creator.
           -> Maybe MetadataType -- ^ The metadata.
           -> [WptType] -- ^ The waypoints (wpt).
           -> [RteType] -- ^ The routes (rte).
           -> [TrkType] -- ^ The tracks (trk).
           -> Maybe ExtensionsType -- ^ The extensions.
           -> GpxType
gpxType = GpxType

instance XmlPickler GpxType where
  xpickle = xpWrap (\(version', creator', metadata', wpt', rte', trk', extensions') -> gpxType version' creator' metadata' wpt' rte' trk' extensions',
              \(GpxType version' creator' metadata' wpt' rte' trk' extensions') -> (version', creator', metadata', wpt', rte', trk', extensions')) (xp7Tuple
                (xpAttr "version" xpText)
                (xpAttr "creator" xpText)
                (xpOption (xpElem "metadata" xpickle))
                (xpList (xpElem "wpt" xpickle))
                (xpList (xpElem "rte" xpickle))
                (xpList (xpElem "trk" xpickle))
                (xpOption (xpElem "extensions" xpickle)))

instance Version GpxType where
  version (GpxType x _ _ _ _ _ _) = x
  setVersion a (GpxType _ b c d e f g) = gpxType a b c d e f g

instance Creator GpxType where
  creator (GpxType _ x _ _ _ _ _) = x
  setCreator b (GpxType a _ c d e f g) = gpxType a b c d e f g

instance Metadata GpxType where
  metadata (GpxType _ _ x _ _ _ _) = x
  setMetadata c (GpxType a b _ d e f g) = gpxType a b c d e f g

instance Wpts GpxType where
  wpts (GpxType _ _ _ x _ _ _) = x
  setWpts d (GpxType a b c _ e f g) = gpxType a b c d e f g

instance Rtes GpxType where
  rtes (GpxType _ _ _ _ x _ _) = x
  setRtes e (GpxType a b c d _ f g) = gpxType a b c d e f g

instance Trks GpxType where
  trks (GpxType _ _ _ _ _ x _) = x
  setTrks f (GpxType a b c d e _ g) = gpxType a b c d e f g

instance Extensions GpxType where
  extensions (GpxType _ _ _ _ _ _ x) = x
  setExtensions g (GpxType a b c d e f _) = gpxType a b c d e f g

instance Name GpxType where
  name = (name =<<) . metadata
  setName x (GpxType a b c d e f g) = gpxType a b (fmap (setName x) c) d e f g

instance Desc GpxType where
  desc = (desc =<<) . metadata
  setDesc x (GpxType a b c d e f g) = gpxType a b (fmap (setDesc x) c) d e f g

instance Author GpxType (Maybe PersonType) where
  author = (author =<<) . metadata
  setAuthor x (GpxType a b c d e f g) = gpxType a b (fmap (setAuthor x) c) d e f g

instance Copyright GpxType where
  copyright = (copyright =<<) . metadata
  setCopyright x (GpxType a b c d e f g) = gpxType a b (fmap (setCopyright x) c) d e f g

instance Links GpxType where
  links = (links =<<) . maybeToList . metadata
  setLinks x (GpxType a b c d e f g) = gpxType a b (fmap (setLinks x) c) d e f g

instance Time GpxType where
  time = (time =<<) . metadata
  setTime x (GpxType a b c d e f g) = gpxType a b (fmap (setTime x) c) d e f g

instance Keywords GpxType where
  keywords = (keywords =<<) . metadata
  setKeywords x (GpxType a b c d e f g) = gpxType a b (fmap (setKeywords x) c) d e f g

instance Bounds GpxType where
  bounds = (bounds =<<) . metadata
  setBounds x (GpxType a b c d e f g) = gpxType a b (fmap (setBounds x) c) d e f g

instance Rtepts GpxType where
  rtepts = (rtepts =<<) . rtes
  setRtepts x (GpxType a b c d e f g) = gpxType a b c d (fmap (setRtepts x) e) f g

instance Trkpts GpxType where
  trkpts = (trkpts =<<) . trks
  setTrkpts x (GpxType a b c d e f g) = gpxType a b c d e (fmap (setTrkpts x) f) g
