{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}

-- | Complex Type: @emailType@ <http://www.topografix.com/GPX/1/1/#type_emailType>
module Data.Geo.Gpx.Email(
  Email
, HasEmail(..)
, xpEmailElem
, xpEmail
) where

import Text.XML.HXT.Core(XmlPickler(..), PU, xpElem, xpWrap, xpAttr, xpPair, xpText0)
import Control.Lens(makeClassy)
import Prelude(Eq(..), Ord(..), Show(..), Functor(..), Bool(..), (.), all, const, either, String)

-- $setup
-- >>> import Prelude
-- >>> import Text.XML.HXT.Core
-- >>> let unpickleEmailElem = fmap (unpickleDoc' xpEmailElem) . runLA xread
-- >>> let allUnpickledEmailElem = all (either (const False) (const True) . unpickleDoc' xpEmailElem) . runLA xread

data Email =
  Email {
    _id ::
      String
  , _domain ::
      String
  } deriving (Eq, Ord, Show)

-- | Pickler for the @email@ element.
--
-- >>> unpickleEmailElem "<email id=\"theid\" domain=\"thedomain\"></email>"
-- [Right (Email {_id = "theid", _domain = "thedomain"})]
--
-- >>> unpickleEmailElem "<email id=\"\" domain=\"thedomain\"/>"
-- [Right (Email {_id = "", _domain = "thedomain"})]
--
-- >>> unpickleEmailElem "<email id=\"the id\" domain=\"\"/>"
-- [Right (Email {_id = "the id", _domain = ""})]
--
-- >>> allUnpickledEmailElem "<email id=\"the id\"/>"
-- False
--
-- >>> allUnpickledEmailElem "<email domain=\"thedomain\"/>"
-- False
xpEmailElem ::
  PU Email
xpEmailElem =
  xpElem "email"
    xpEmail

-- | Pickler for the @Email@ type.
xpEmail ::
  PU Email
xpEmail =
   xpWrap
     (
       \(id', domain') -> Email id' domain'
     , \(Email id' domain') -> (id', domain')
     )
     (xpPair
       (xpAttr "id" xpText0)
       (xpAttr "domain" xpText0))

instance XmlPickler Email where
  xpickle =
    xpEmail

makeClassy ''Email
