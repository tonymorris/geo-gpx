module Geo.GPX.ExtensionsType where

import Text.XML.HXT.Arrow

newtype ExtensionsType = ExtensionsType XmlTree
  deriving (Eq, Show)

instance XmlPickler ExtensionsType where
  xpickle = xpWrap (ExtensionsType, \(ExtensionsType t) -> t) xpTree
