module Data.Geo.GPX.Accessor.Hdop where

class Hdop a where
  hdop :: a -> Maybe Double
  setHdop :: Maybe Double -> a -> a
