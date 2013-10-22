{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}

-- | Complex Type: @personType@ <http://www.topografix.com/GPX/1/1/#type_personType>
module Data.Geo.Gpx.Person(
  Person
, HasPerson(..)
, name'
, email'
, linkP'
, person'
, xpAuthorElem
, xpPerson
) where

import Data.Geo.Gpx.Email(Email, xpEmailElem)
import Data.Geo.Gpx.Link(Link, xpLinkElem)
import Text.XML.HXT.Core(XmlPickler(..), PU, xpElem, xpText0, xpOption, xpWrap, xpTriple)
import Control.Lens(makeClassy, Prism', prism')
import Prelude(Maybe(..), String, Eq, Ord, Show, fmap)
import Control.Applicative(Applicative(..), (<$>))

-- $setup
-- >>> import Prelude
-- >>> import Text.XML.HXT.Core
-- >>> let unpickleAuthorElem = fmap (unpickleDoc' xpAuthorElem) . runLA xread
-- >>> let allUnpickledAuthorElem = all (either (const False) (const True) . unpickleDoc' xpAuthorElem) . runLA xread

data Person =
  Person {
    _name :: Maybe String
  , _emailP :: Maybe Email
  , _linkP :: Maybe Link
  } deriving (Eq, Ord, Show)

name' ::
  Prism' Person (String, Maybe Email, Maybe Link)
name' =
  prism'
    (\(n, m, l) -> Person (Just n) m l)
    (\(Person n m l) -> fmap (\n' -> (n', m, l)) n)

email' ::
  Prism' Person (Maybe String, Email, Maybe Link)
email' =
  prism'
    (\(n, m, l) -> Person n (Just m) l)
    (\(Person n m l) -> fmap (\m' -> (n, m', l)) m)

linkP' ::
  Prism' Person (Maybe String, Maybe Email, Link)
linkP' =
  prism'
    (\(n, m, l) -> Person n m (Just l))
    (\(Person n m l) -> fmap (\l' -> (n, m, l')) l)

person' ::
  Prism' Person (String, Email, Link)
person' =
  prism'
    (\(n, m, l) -> Person (Just n) (Just m) (Just l))
    (\(Person n m l) -> (,,) <$> n <*> m <*> l)


-- | Pickler for the @author@ element.
--
-- >>> unpickleAuthorElem "<author></author>"
-- [Right (Person {_name = Nothing, _emailP = Nothing, _linkP = Nothing})]
--
-- >>> unpickleAuthorElem "<author><name>the name</name><email id=\"id\" domain=\"domain.com\"/><link href=\"href\"><text>text</text><type>type</type></link></author>"
-- [Right (Person {_name = Just "the name", _emailP = Just (Email {_id = "id", _domain = "domain.com"}), _linkP = Just (Link {_href = "href", _text = Just "text", _tyype = Just "type"})})]
xpAuthorElem::
  PU Person
xpAuthorElem =
  xpElem "author"
    xpPerson

xpPerson ::
  PU Person
xpPerson =
  xpWrap
    (\(n, e, l) -> Person n e l, \(Person n e l) -> (n, e, l))
    (xpTriple
      (xpOption (xpElem "name" xpText0))
      (xpOption xpEmailElem)
      (xpOption xpLinkElem))

instance XmlPickler Person where
  xpickle =
    xpPerson

makeClassy ''Person
