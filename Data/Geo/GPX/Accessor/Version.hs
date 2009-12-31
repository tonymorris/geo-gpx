module Data.Geo.GPX.Accessor.Version where

class Version a where
  version :: a -> String
  setVersion :: String -> a -> a
