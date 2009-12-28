module Geo.GPX.GpxType where

import Geo.GPX.MetadataType
import Geo.GPX.WptType
import Geo.GPX.RteType
import Geo.GPX.TrkType
import Geo.GPX.ExtensionsType
import Text.XML.HXT.Arrow

data GpxType = GpxType String (Maybe MetadataType) [WptType] [RteType] [TrkType] (Maybe ExtensionsType)
  deriving (Eq, Show)

gpxType :: String
           -> Maybe MetadataType
           -> [WptType]
           -> [RteType]
           -> [TrkType]
           -> Maybe ExtensionsType
           -> GpxType
gpxType = GpxType

instance XmlPickler GpxType where
  xpickle = undefined
