module Data.Geo.GPX.Accessor.Creator where

class Creator a where
  creator :: a -> String
  setCreator :: String -> a -> a
