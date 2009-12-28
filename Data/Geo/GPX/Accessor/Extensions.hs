module Data.Geo.GPX.Accessor.Extensions where

import Data.Geo.GPX.ExtensionsType

class Extensions a where
  extensions :: a -> Maybe ExtensionsType
