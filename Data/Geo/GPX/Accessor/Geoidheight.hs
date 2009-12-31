module Data.Geo.GPX.Accessor.Geoidheight where

class Geoidheight a where
  geoidheight :: a -> Maybe Double
  setGeoidheight :: Maybe Double -> a -> a
