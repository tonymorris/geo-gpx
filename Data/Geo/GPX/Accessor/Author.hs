{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies #-}

module Data.Geo.GPX.Accessor.Author where

import Data.Geo.GPX.Accessor.Accessor

class Author a b | a -> b where
  author :: a -> b
  setAuthor :: b -> a -> a

  usingAuthor :: (b -> b) -> a -> a
  usingAuthor = author `using` setAuthor
