module Data.Geo.GPX.Accessor.Metadata where

import Data.Geo.GPX.MetadataType

class Metadata a where
  metadata :: a -> Maybe MetadataType
  setMetadata :: Maybe MetadataType -> a -> a
