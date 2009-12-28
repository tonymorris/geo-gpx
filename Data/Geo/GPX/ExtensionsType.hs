{-# LANGUAGE MultiParamTypeClasses, TypeSynonymInstances #-}

module Data.Geo.GPX.ExtensionsType where

import Text.XML.HXT.Arrow
import Data.Geo.GPX.Accessor.Value

newtype ExtensionsType = ExtensionsType XmlTree
  deriving (Eq, Show)

instance XmlPickler ExtensionsType where
  xpickle = xpWrap (ExtensionsType, \(ExtensionsType t) -> t) xpTree

extensionsType :: XmlTree -> ExtensionsType
extensionsType = ExtensionsType

instance Value ExtensionsType XmlTree where
  value (ExtensionsType x) = x
