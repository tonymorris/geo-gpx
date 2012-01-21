module Data.Geo.GPX.Lens.MetadataL where

import Data.Geo.GPX.Type.Metadata
import Data.Lens.Common

class MetadataL a where
  metadataL :: Lens a (Maybe Metadata)

