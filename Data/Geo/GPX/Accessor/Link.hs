module Data.Geo.GPX.Accessor.Link where

import Data.Geo.GPX.LinkType

class Link a where
  link :: a -> Maybe LinkType
  setLink :: Maybe LinkType -> a -> a
