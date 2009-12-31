module Data.Geo.GPX.Accessor.Metadata where

import Data.Geo.GPX.MetadataType
import Data.Geo.GPX.Accessor.Accessor

class Metadata a where
  metadata :: a -> Maybe MetadataType
  setMetadata :: Maybe MetadataType -> a -> a

  setMetadata' :: MetadataType -> a -> a
  setMetadata' = setMetadata . Just

  usingMetadata :: a -> (Maybe MetadataType -> Maybe MetadataType) -> a
  usingMetadata = metadata `using` setMetadata
