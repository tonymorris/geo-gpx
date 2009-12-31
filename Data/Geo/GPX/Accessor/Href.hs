module Data.Geo.GPX.Accessor.Href where

class Href a where
  href :: a -> String
  setHref :: String -> a -> a