module Geo.GPX.MetadataType where

import Geo.GPX.PersonType
import Geo.GPX.CopyrightType
import Geo.GPX.LinkType
import Geo.GPX.BoundsType
import Geo.GPX.ExtensionsType
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras

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
  xpickle = xpWrap (\(a, b, c, d, e, f, g, h, i) -> metadataType a b c d e f g h i, \(MetadataType a b c d e f g h i) -> (a, b, c, d, e, f, g, h, i)) (xp9Tuple
              (xpOption (xpElem "name" xpText))
              (xpOption (xpElem "desc" xpText))
              (xpOption (xpElem "author" xpickle))
              (xpOption (xpElem "copyright" xpickle))
              (xpList (xpElem "link" xpickle))
              (xpOption (xpElem "time" xpText))
              (xpOption (xpElem "keywords" xpText))
              (xpOption (xpElem "bounds" xpickle))
              (xpOption (xpElem "extensions" xpickle)))
