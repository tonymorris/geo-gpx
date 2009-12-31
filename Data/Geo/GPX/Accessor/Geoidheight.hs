module Data.Geo.GPX.Accessor.Geoidheight where

import Data.Geo.GPX.Accessor.Accessor

class Geoidheight a where
  geoidheight :: a -> Maybe Double
  setGeoidheight :: Maybe Double -> a -> a

  setGeoidheight' :: Double -> a -> a
  setGeoidheight' = setGeoidheight . Just

  usingGeoidheight :: a -> (Maybe Double -> Maybe Double) -> a
  usingGeoidheight = geoidheight `using` setGeoidheight
