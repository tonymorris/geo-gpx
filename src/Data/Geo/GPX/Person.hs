-- | Complex Type: @personType@ <http://www.topografix.com/GPX/1/1/#type_personType>
module Data.Geo.GPX.Person(
  Person
, person
) where

import Data.Geo.GPX.Email
import Data.Geo.GPX.Link
import Text.XML.HXT.Arrow

data Person = Person (Maybe String) (Maybe Email) (Maybe Link)
  deriving (Eq, Ord)

person ::
  Maybe String -- ^ The name.
  -> Maybe Email -- ^ The email.
  -> Maybe Link -- ^ The link.
  -> Person
person =
  Person

