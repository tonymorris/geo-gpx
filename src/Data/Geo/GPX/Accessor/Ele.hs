module Data.Geo.GPX.Accessor.Ele where

import Data.Geo.GPX.Accessor.Accessor

class Ele a where
  ele :: a -> Maybe Double
  setEle :: Maybe Double -> a -> a

  setEle' :: Double -> a -> a
  setEle' = setEle . Just

  usingEle :: (Maybe Double -> Maybe Double) -> a -> a
  usingEle = ele `using` setEle

  usingEle' :: (Double -> Double) -> a -> a
  usingEle' = usingEle . fmap
