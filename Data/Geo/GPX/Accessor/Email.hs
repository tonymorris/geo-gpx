module Data.Geo.GPX.Accessor.Email where

import Data.Geo.GPX.EmailType
import Data.Geo.GPX.Accessor.Accessor

class Email a where
  email :: a -> Maybe EmailType
  setEmail :: Maybe EmailType -> a -> a

  setEmail' :: EmailType -> a -> a
  setEmail' = setEmail . Just

  usingEmail :: (Maybe EmailType -> Maybe EmailType) -> a -> a
  usingEmail = email `using` setEmail

  usingEmail' :: (EmailType -> EmailType) -> a -> a
  usingEmail' = usingEmail . fmap
