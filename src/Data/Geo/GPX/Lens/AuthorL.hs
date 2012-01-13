{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies #-}

module Data.Geo.GPX.Lens.AuthorL where

import Data.Lens.Common

class AuthorL a b | a -> b where
  authorL :: Lens a b

