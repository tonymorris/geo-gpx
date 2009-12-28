module Geo.GPX.Email where

data Email = Email String String
  deriving Eq

email :: String -> String -> Email
email = Email
