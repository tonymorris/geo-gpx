module Data.Geo.GPX.Accessor.Links where

import Data.Geo.GPX.LinkType
import Data.Geo.GPX.Accessor.Accessor

class Links a where
  links :: a -> [LinkType]
  setLinks :: [LinkType] -> a -> a

  setLinks' :: LinkType -> a -> a
  setLinks' = setLinks . return

  usingLinks :: a -> ([LinkType] -> [LinkType]) -> a
  usingLinks = links `using` setLinks
