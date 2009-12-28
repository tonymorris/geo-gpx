module Data.Geo.GPX.Accessor.Keywords where

class Keywords a where
  keywords :: a -> Maybe String
