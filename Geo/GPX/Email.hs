module Geo.GPX.Email where

import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

data Email = Email String String
  deriving Eq

email :: String -> String -> Email
email = Email

instance XmlPickler Email where
  xpickle = undefined

instance Show Email where
  show = showPickled []
