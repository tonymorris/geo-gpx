module Data.Geo.GPX.Accessor.Vdop where

import Data.Geo.GPX.Accessor.Accessor

class Vdop a where
  vdop :: a -> Maybe Double
  setVdop :: Maybe Double -> a -> a

  setVdop' :: Double -> a -> a
  setVdop' = setVdop . Just

  usingVdop :: a -> (Maybe Double -> Maybe Double) -> a
  usingVdop = vdop `using` setVdop
