module Data.Geo.GPX.Accessor.Pdop where

import Data.Geo.GPX.Accessor.Accessor

class Pdop a where
  pdop :: a -> Maybe Double
  setPdop :: Maybe Double -> a -> a

  setPdop' :: Double -> a -> a
  setPdop' = setPdop . Just

  usingPdop :: a -> (Maybe Double -> Maybe Double) -> a
  usingPdop = pdop `using` setPdop
