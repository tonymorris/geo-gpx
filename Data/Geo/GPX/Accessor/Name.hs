module Data.Geo.GPX.Accessor.Name where

import Data.Geo.GPX.Accessor.Accessor

class Name a where
  name :: a -> Maybe String
  setName :: Maybe String -> a -> a

  setName' :: String -> a -> a
  setName' = setName . Just

  usingName :: a -> (Maybe String -> Maybe String) -> a
  usingName = name `using` setName
