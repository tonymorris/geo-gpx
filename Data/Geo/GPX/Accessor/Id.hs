module Data.Geo.GPX.Accessor.Id where

class Id a where
  id :: a -> String
  setId :: String -> a -> a
