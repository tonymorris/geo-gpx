{-# LANGUAGE MultiParamTypeClasses, TypeSynonymInstances #-}

-- | Complex Type: @extensionsType@ <http://www.topografix.com/GPX/1/1/#type_extensionsType>
module Data.Geo.GPX.Extensions(
  Extensions
, extensions
) where

import Text.XML.HXT.Arrow

newtype Extensions = Extensions XmlTree
  deriving (Eq, Ord)

