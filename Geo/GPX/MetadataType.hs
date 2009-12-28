module Geo.GPX.MetadataType where

import Geo.GPX.PersonType
import Geo.GPX.CopyrightType
import Geo.GPX.LinkType
import Geo.GPX.BoundsType
import Geo.GPX.ExtensionsType
import Text.XML.HXT.Arrow

data MetadataType = MetadataType (Maybe String) (Maybe String) (Maybe PersonType) (Maybe CopyrightType) [LinkType] (Maybe String) (Maybe String) (Maybe BoundsType) (Maybe ExtensionsType)
  deriving (Eq, Show)

metadataType :: Maybe String
                -> Maybe String
                -> Maybe PersonType
                -> Maybe CopyrightType
                -> [LinkType]
                -> Maybe String
                -> Maybe String
                -> Maybe BoundsType
                -> Maybe ExtensionsType
                -> MetadataType
metadataType = MetadataType

instance XmlPickler MetadataType where
  xpickle = undefined
