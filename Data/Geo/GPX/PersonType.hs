module Data.Geo.GPX.PersonType where

import Data.Geo.GPX.EmailType
import Data.Geo.GPX.LinkType
import Text.XML.HXT.Arrow

data PersonType = PersonType (Maybe String) (Maybe EmailType) (Maybe LinkType)
  deriving (Eq, Show)

personType :: Maybe String -> Maybe EmailType -> Maybe LinkType -> PersonType
personType = PersonType

instance XmlPickler PersonType where
  xpickle = xpWrap (\(name, email, link) -> personType name email link, \(PersonType name email link) -> (name, email, link)) (xpTriple
              (xpOption (xpElem "name" xpText))
              (xpOption (xpElem "email" xpickle))
              (xpOption (xpElem "link" xpickle)))
