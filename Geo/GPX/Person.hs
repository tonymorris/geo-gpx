module Geo.GPX.Person where

import Geo.GPX.Email
import Geo.GPX.Link

data Person = Person (Maybe String) (Maybe Email) (Maybe Link)
  deriving Eq

person :: Maybe String -> Maybe Email -> Maybe Link -> Person
person = Person
