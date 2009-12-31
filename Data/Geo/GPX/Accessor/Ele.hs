module Data.Geo.GPX.Accessor.Ele where

class Ele a where
  ele :: a -> Maybe Double
  setEle :: Maybe Double -> a -> a
