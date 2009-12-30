{-# LANGUAGE FlexibleContexts, FlexibleInstances, UndecidableInstances #-}

module Data.Geo.GPX.Accessor.Latlon where

class Latlon a where
  latlon :: a -> (Double, Double)

instance (Real a, Real b) => Latlon (a, b) where
  latlon (a, b) = (realToFrac a, realToFrac b)
