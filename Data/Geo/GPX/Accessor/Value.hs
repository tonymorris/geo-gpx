{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies #-}

module Data.Geo.GPX.Accessor.Value where

class Value a b | a -> b where
  value :: a -> b
  setValue :: b -> a -> a
