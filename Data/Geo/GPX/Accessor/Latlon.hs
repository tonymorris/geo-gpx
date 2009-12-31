{-# LANGUAGE FlexibleContexts, FlexibleInstances, UndecidableInstances #-}

module Data.Geo.GPX.Accessor.Latlon where

class Latlon a where
  latlon :: a -> (Double, Double)
  setLatlon :: (Double, Double) -> a -> a
