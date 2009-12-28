module Data.Geo.GPX.Accessor.Author where

class Author a where
  author :: a -> String
