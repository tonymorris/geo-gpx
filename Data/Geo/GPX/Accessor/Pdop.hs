module Data.Geo.GPX.Accessor.Pdop where

class Pdop a where
  pdop :: a -> Maybe Double
  setPdop :: Maybe Double -> a -> a
