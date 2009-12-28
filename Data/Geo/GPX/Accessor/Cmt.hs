module Data.Geo.GPX.Accessor.Cmt where

class Cmt a where
  cmt :: a -> Maybe String
