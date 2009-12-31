{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies #-}

module Data.Geo.GPX.Accessor.Author where

class Author a b | a -> b where
  author :: a -> b
  setAuthor :: b -> a -> a
