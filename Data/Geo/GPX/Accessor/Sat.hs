module Data.Geo.GPX.Accessor.Sat where

class Sat a where
  sat :: a -> Maybe Int