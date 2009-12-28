module Data.Geo.GPX.Accessor.Hdop where

class Hdop a where
  hdop :: a -> Maybe Double
