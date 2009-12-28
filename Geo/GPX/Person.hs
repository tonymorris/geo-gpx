module Geo.GPX.Person where

import Geo.GPX.Email
import Geo.GPX.Link
import Text.XML.HXT.Arrow

data Person = Person (Maybe String) (Maybe Email) (Maybe Link)
  deriving (Eq, Show)

person :: Maybe String -> Maybe Email -> Maybe Link -> Person
person = Person

instance XmlPickler Person where
  xpickle = undefined
