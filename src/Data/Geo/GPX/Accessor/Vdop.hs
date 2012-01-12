module Data.Geo.GPX.Accessor.Vdop where

import Data.Geo.GPX.Accessor.Accessor

class Vdop a where
  vdop :: a -> Maybe Double
  setVdop :: Maybe Double -> a -> a

  setVdop' :: Double -> a -> a
  setVdop' = setVdop . Just

  usingVdop :: (Maybe Double -> Maybe Double) -> a -> a
  usingVdop = vdop `using` setVdop

  usingVdop' :: (Double -> Double) -> a -> a
  usingVdop' = usingVdop . fmap
