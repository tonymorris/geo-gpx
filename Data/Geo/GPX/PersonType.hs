-- | Complex Type: @personType@ <http://www.topografix.com/GPX/1/1/#type_personType>
module Data.Geo.GPX.PersonType where

import Data.Geo.GPX.EmailType
import Data.Geo.GPX.LinkType
import Data.Geo.GPX.Accessor.Name
import Data.Geo.GPX.Accessor.Email
import Data.Geo.GPX.Accessor.Link
import Text.XML.HXT.Arrow

data PersonType = PersonType (Maybe String) (Maybe EmailType) (Maybe LinkType)
  deriving (Eq, Show)

personType :: Maybe String -- ^ The name.
              -> Maybe EmailType -- ^ The email.
              -> Maybe LinkType -- ^ The link.
              -> PersonType
personType = PersonType

instance XmlPickler PersonType where
  xpickle = xpWrap (\(name', email', link') -> personType name' email' link', \(PersonType name' email' link') -> (name', email', link')) (xpTriple
              (xpOption (xpElem "name" xpText))
              (xpOption (xpElem "email" xpickle))
              (xpOption (xpElem "link" xpickle)))

instance Name PersonType where
  name (PersonType x _ _) = x

instance Email PersonType where
  email (PersonType _ x _) = x

instance Link PersonType where
  link (PersonType _ _ x) = x
