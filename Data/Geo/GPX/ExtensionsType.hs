{-# LANGUAGE MultiParamTypeClasses, TypeSynonymInstances #-}

-- | Complex Type: @extensionsType@ <http://www.topografix.com/GPX/1/1/#type_extensionsType>
module Data.Geo.GPX.ExtensionsType(
                                    ExtensionsType,
                                    extensionsType
                                  ) where

import Text.XML.HXT.Arrow
import Data.Geo.GPX.Accessor.Value

newtype ExtensionsType = ExtensionsType XmlTree
  deriving (Eq, Show)

instance XmlPickler ExtensionsType where
  xpickle = xpWrap (ExtensionsType, \(ExtensionsType t) -> t) xpTree

extensionsType :: XmlTree -- ^ The extensions sub-tree.
                  -> ExtensionsType
extensionsType = ExtensionsType

instance Value ExtensionsType XmlTree where
  value (ExtensionsType x) = x
