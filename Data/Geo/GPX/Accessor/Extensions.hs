module Data.Geo.GPX.Accessor.Extensions where

import Data.Geo.GPX.ExtensionsType
import Data.Geo.GPX.Accessor.Accessor

class Extensions a where
  extensions :: a -> Maybe ExtensionsType
  setExtensions :: Maybe ExtensionsType -> a -> a

  setExtensions' :: ExtensionsType -> a -> a
  setExtensions' = setExtensions . Just

  usingExtensions :: (Maybe ExtensionsType -> Maybe ExtensionsType) -> a -> a
  usingExtensions = extensions `using` setExtensions

  usingExtensions' :: (ExtensionsType -> ExtensionsType) -> a -> a
  usingExtensions' = usingExtensions . fmap
