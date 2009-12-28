module Geo.GPX.GpxType where

import Geo.GPX.MetadataType
import Geo.GPX.WptType
import Geo.GPX.RteType
import Geo.GPX.TrkType
import Geo.GPX.ExtensionsType
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
