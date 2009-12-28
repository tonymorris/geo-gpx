module Geo.GPX.Email where

import Text.XML.HXT.Arrow

data Email = Email String String
  deriving (Eq, Show)

email :: String -> String -> Email
email = Email

instance XmlPickler Email where
  xpickle = undefined
