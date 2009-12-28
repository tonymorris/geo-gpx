module Data.Geo.GPX.Accessor.Src where

class Src a where
  src :: a -> Maybe String
