module Data.Geo.GPX.GpxType where

import Data.Geo.GPX.MetadataType
import Data.Geo.GPX.WptType
import Data.Geo.GPX.RteType
import Data.Geo.GPX.TrkType
import Data.Geo.GPX.ExtensionsType
import Data.Geo.GPX.Accessor.Version
import Data.Geo.GPX.Accessor.Creator
import Data.Geo.GPX.Accessor.Metadata
import Data.Geo.GPX.Accessor.Wpts
import Data.Geo.GPX.Accessor.Rtes
import Data.Geo.GPX.Accessor.Trks
import Data.Geo.GPX.Accessor.Extensions
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras

data GpxType = GpxType String String (Maybe MetadataType) [WptType] [RteType] [TrkType] (Maybe ExtensionsType)
  deriving (Eq, Show)

gpxType :: String
           -> String
           -> Maybe MetadataType
           -> [WptType]
           -> [RteType]
           -> [TrkType]
           -> Maybe ExtensionsType
           -> GpxType
gpxType = GpxType

instance XmlPickler GpxType where
  xpickle = xpWrap (\(version, creator, metadata, wpt, rte, trk, extensions) -> gpxType version creator metadata wpt rte trk extensions,
              \(GpxType version creator metadata wpt rte trk extensions) -> (version, creator, metadata, wpt, rte, trk, extensions)) (xp7Tuple
                (xpAttr "version" xpText)
                (xpAttr "creator" xpText)
                (xpOption (xpElem "metadata" xpickle))
                (xpList (xpElem "wpt" xpickle))
                (xpList (xpElem "rte" xpickle))
                (xpList (xpElem "trk" xpickle))
                (xpOption (xpElem "extensions" xpickle)))

instance Version GpxType where
  version (GpxType x _ _ _ _ _ _) = x

instance Creator GpxType where
  creator (GpxType _ x _ _ _ _ _) = x

instance Metadata GpxType where
  metadata (GpxType _ _ x _ _ _ _) = x

instance Wpts GpxType where
  wpts (GpxType _ _ _ x _ _ _) = x

instance Rtes GpxType where
  rtes (GpxType _ _ _ _ x _ _) = x

instance Trks GpxType where
  trks (GpxType _ _ _ _ _ x _) = x

instance Extensions GpxType where
  extensions (GpxType _ _ _ _ _ _ x) = x
