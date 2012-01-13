-- | Complex Type: @personType@ <http://www.topografix.com/GPX/1/1/#type_personType>
module Data.Geo.GPX.Person(
  Person
, person
) where

import Data.Geo.GPX.Email
import Data.Geo.GPX.Link
import Data.Geo.GPX.Lens.NameL
import Data.Geo.GPX.Lens.EmailL
import Data.Geo.GPX.Lens.LinkL
import Data.Lens.Common
import Control.Comonad.Trans.Store
import Text.XML.HXT.Arrow.Pickle

data Person = Person (Maybe String) (Maybe Email) (Maybe Link)
  deriving (Eq, Ord)

person ::
  Maybe String -- ^ The name.
  -> Maybe Email -- ^ The email.
  -> Maybe Link -- ^ The link.
  -> Person
person =
  Person

instance NameL Person where
  nameL =
    Lens $ \(Person name email link) -> store (\name -> Person name email link) name

instance EmailL Person where
  emailL =
    Lens $ \(Person name email link) -> store (\email -> Person name email link) email

instance LinkL Person where
  linkL =
    Lens $ \(Person name email link) -> store (\link -> Person name email link) link

instance XmlPickler Person where
  xpickle =
    xpWrap (\(name', email', link') -> person name' email' link', \(Person name' email' link') -> (name', email', link')) (xpTriple
           (xpOption (xpElem "name" xpText))
           (xpOption (xpElem "email" xpickle))
           (xpOption (xpElem "link" xpickle)))

