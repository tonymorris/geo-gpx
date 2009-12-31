module Data.Geo.GPX.Accessor.Name where

class Name a where
  name :: a -> Maybe String
  setName :: Maybe String -> a -> a
