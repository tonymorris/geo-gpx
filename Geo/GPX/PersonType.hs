module Geo.GPX.PersonType where

import Geo.GPX.EmailType
import Geo.GPX.LinkType
import Text.XML.HXT.Arrow

data PersonType = PersonType (Maybe String) (Maybe EmailType) (Maybe LinkType)
  deriving (Eq, Show)

personType :: Maybe String -> Maybe EmailType -> Maybe LinkType -> PersonType
personType = PersonType

instance XmlPickler PersonType where
  xpickle = undefined
