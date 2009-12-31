module Data.Geo.GPX.Accessor.Hdop where

import Data.Geo.GPX.Accessor.Accessor

class Hdop a where
  hdop :: a -> Maybe Double
  setHdop :: Maybe Double -> a -> a

  setHdop' :: Double -> a -> a
  setHdop' = setHdop . Just

  usingHdop :: a -> (Maybe Double -> Maybe Double) -> a
  usingHdop = hdop `using` setHdop
