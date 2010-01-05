module Data.Geo.GPX.Accessor.Name where

import Data.Geo.GPX.Accessor.Accessor

class Name a where
  name :: a -> Maybe String
  setName :: Maybe String -> a -> a

  setName' :: String -> a -> a
  setName' = setName . Just

  usingName :: (Maybe String -> Maybe String) -> a -> a
  usingName = name `using` setName

  usingName' :: (String -> String) -> a -> a
  usingName' = usingName . fmap
