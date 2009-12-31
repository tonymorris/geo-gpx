module Data.Geo.GPX.Accessor.Links where

import Data.Geo.GPX.LinkType

class Links a where
  links :: a -> [LinkType]
  setLinks :: [LinkType] -> a -> a
