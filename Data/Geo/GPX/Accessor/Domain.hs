module Data.Geo.GPX.Accessor.Domain where

class Domain a where
  domain :: a -> String
