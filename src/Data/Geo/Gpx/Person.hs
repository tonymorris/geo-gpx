-- | Complex Type: @personType@ <http://www.topografix.com/GPX/1/1/#type_personType>
module Data.Geo.Gpx.Person(
  Person
, person
) where

import Data.Geo.Gpx.Email
import Data.Geo.Gpx.Link

data Person = Person (Maybe String) (Maybe Email) (Maybe Link)
  deriving (Eq, Ord)

person ::
  Maybe String -- ^ The name.
  -> Maybe Email -- ^ The email.
  -> Maybe Link -- ^ The link.
  -> Person
person =
  Person

{-
instance NameL Person where
  nameL =
    Lens $ \(Person name email link) -> store (\name -> Person name email link) name

instance EmailL Person where
  emailL =
    Lens $ \(Person name email link) -> store (\email -> Person name email link) email

instance LinkL Person where
  linkL =
    Lens $ \(Person name email link) -> store (\link -> Person name email link) link
-}

{-
instance XmlPickler Person where
  xpickle =
    xpWrap (\(name', email', link') -> person name' email' link', \(Person name' email' link') -> (name', email', link')) (xpTriple
           (xpOption (xpElem "name" xpText))
           (xpOption (xpElem "email" xpickle))
           (xpOption (xpElem "link" xpickle)))
-}
