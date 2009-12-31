module Data.Geo.GPX.Accessor.Email where

import Data.Geo.GPX.EmailType

class Email a where
  email :: a -> Maybe EmailType
  setEmail :: Maybe EmailType -> a -> a
