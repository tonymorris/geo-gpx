module Data.Geo.GPX.Accessor.Link where

import Data.Geo.GPX.LinkType
import Data.Geo.GPX.Accessor.Accessor

class Link a where
  link :: a -> Maybe LinkType
  setLink :: Maybe LinkType -> a -> a

  setLink' :: LinkType -> a -> a
  setLink' = setLink . Just

  usingLink :: (Maybe LinkType -> Maybe LinkType) -> a -> a
  usingLink = link `using` setLink

  usingLink' :: (LinkType -> LinkType) -> a -> a
  usingLink' = usingLink . fmap
