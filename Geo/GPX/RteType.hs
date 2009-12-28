module Geo.GPX.RteType where

import Geo.GPX.WptType
import Geo.GPX.ExtensionsType
import Geo.GPX.LinkType
import Text.XML.HXT.Arrow

data RteType = RteType (Maybe String) (Maybe String) (Maybe String) [LinkType] (Maybe Int) (Maybe String) (Maybe ExtensionsType) [WptType]
  deriving (Eq, Show)

rteType :: Maybe String
           -> Maybe String
           -> Maybe String
           -> [LinkType]
           -> Maybe Int
           -> Maybe String
           -> Maybe ExtensionsType
           -> [WptType]
           -> RteType
rteType a b c d e = RteType a b c d (fmap abs e)

instance XmlPickler RteType where
  xpickle = undefined
