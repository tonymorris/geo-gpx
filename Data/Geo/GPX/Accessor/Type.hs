module Data.Geo.GPX.Accessor.Type where

class Type a where
  type' :: a -> Maybe String
  setType :: Maybe String -> a -> a
