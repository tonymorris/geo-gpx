module Data.Geo.GPX.Accessor.Sym where

class Sym a where
  sym :: a -> Maybe String
  setSym :: Maybe String -> a -> a
