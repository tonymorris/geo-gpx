module Data.Geo.GPX.Accessor.Name where

class Name a where
  name :: a -> Maybe String
