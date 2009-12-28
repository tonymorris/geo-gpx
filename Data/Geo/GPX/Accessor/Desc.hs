module Data.Geo.GPX.Accessor.Desc where

class Desc a where
  desc :: a -> Maybe String
