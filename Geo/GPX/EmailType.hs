module Geo.GPX.EmailType where

import Text.XML.HXT.Arrow

data EmailType = EmailType String String
  deriving (Eq, Show)

emailType :: String -> String -> EmailType
emailType = EmailType

instance XmlPickler EmailType where
  xpickle = undefined
