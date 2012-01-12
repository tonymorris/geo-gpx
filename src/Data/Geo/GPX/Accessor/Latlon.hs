{-# LANGUAGE FlexibleContexts, FlexibleInstances, UndecidableInstances #-}

module Data.Geo.GPX.Accessor.Latlon where
import Data.Geo.GPX.Accessor.Accessor

class Latlon a where
  latlon :: a -> (Double, Double)
  setLatlon :: (Double, Double) -> a -> a

  usingLatlon :: ((Double, Double) -> (Double, Double)) -> a -> a
  usingLatlon = latlon `using` setLatlon
