module Data.Geo.GPX.Accessor.Extensions where

import Data.Geo.GPX.ExtensionsType
import Data.Geo.GPX.Accessor.Accessor

class Extensions a where
  extensions :: a -> Maybe ExtensionsType
  setExtensions :: Maybe ExtensionsType -> a -> a

  setExtensions' :: ExtensionsType -> a -> a
  setExtensions' = setExtensions . Just

  usingExtensions :: a -> (Maybe ExtensionsType -> Maybe ExtensionsType) -> a
  usingExtensions = extensions `using` setExtensions
