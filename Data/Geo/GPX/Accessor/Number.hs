module Data.Geo.GPX.Accessor.Number where

class Number a where
  number :: a -> Maybe Int
  setNumber :: Maybe Int -> a -> a
