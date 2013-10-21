{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}

-- | Complex Type: @copyrightType@ <http://www.topografix.com/GPX/1/1/#type_copyrightType>
module Data.Geo.Gpx.Copyright(
  Copyright(..)
, xpCopyrightElem
, xpCopyright
, author
, year
, license
) where

import Text.XML.HXT.Core(XmlPickler(..), PU, xpAttr, xpElem, xpText0, xpOption, xpWrap, xpTriple)
import Control.Lens(makeClassy)
import Prelude(Maybe(..), String, Eq, Ord, Show)

-- $setup
-- >>> import Prelude
-- >>> import Text.XML.HXT.Core
-- >>> let unpickleCopyrightElem = fmap (unpickleDoc' xpCopyrightElem) . runLA xread
-- >>> let allUnpickledCopyrightElem = all (either (const False) (const True) . unpickleDoc' xpCopyrightElem) . runLA xread

data Copyright =
  Copyright {
    _author ::
      String
  , _year ::
      Maybe String
  , _license ::
      Maybe String
  } deriving (Eq, Ord, Show)

makeClassy ''Copyright

-- | Pickler for the @copyright@ element.
--
-- >>> unpickleCopyrightElem "<copyright author=\"Bob\"><year>2010</year><license>BSD3</license></copyright>"
-- [Right (Copyright {_author = "Bob", _year = Just "2010", _license = Just "BSD3"})]
--
-- >>> allUnpickledCopyrightElem "<copyright><year>2010</year><license>BSD3</license></copyright>"
-- False
--
-- >>> unpickleCopyrightElem "<copyright author=\"Bob\"><year>2010</year></copyright>"
-- [Right (Copyright {_author = "Bob", _year = Just "2010", _license = Nothing})]
--
-- >>> unpickleCopyrightElem "<copyright author=\"Bob\"><license>BSD3</license></copyright>"
-- [Right (Copyright {_author = "Bob", _year = Nothing, _license = Just "BSD3"})]
--
-- >>> unpickleCopyrightElem "<copyright author=\"Bob\"></copyright>"
-- [Right (Copyright {_author = "Bob", _year = Nothing, _license = Nothing})]
--
-- >>> unpickleCopyrightElem "<copyright author=\"\"><year>2010</year><license>BSD3</license></copyright>"
-- [Right (Copyright {_author = "", _year = Just "2010", _license = Just "BSD3"})]
--
-- >>> unpickleCopyrightElem "<copyright author=\"Bob\"><year></year><license>BSD3</license></copyright>"
-- [Right (Copyright {_author = "Bob", _year = Just "", _license = Just "BSD3"})]
--
-- >>> unpickleCopyrightElem "<copyright author=\"Bob\"><year>2010</year><license></license></copyright>"
-- [Right (Copyright {_author = "Bob", _year = Just "2010", _license = Just ""})]
--
-- >>> allUnpickledCopyrightElem "<copyright author=\"Bob\"><x>x</x></copyright>"
-- False
--
-- >>> allUnpickledCopyrightElem "<c author=\"Bob\"><year>2010</year></c>"
-- False
xpCopyrightElem ::
  PU Copyright
xpCopyrightElem =
   xpElem "copyright"
     xpCopyright

-- | Pickler for the @Copyright@ type.
xpCopyright ::
  PU Copyright
xpCopyright =
   xpWrap
     (
       \(author', year', license') -> Copyright author' year' license'
     , \(Copyright author' year' license') -> (author', year', license')
     )
     (xpTriple
       (xpAttr "author" xpText0)
       (xpOption (xpElem "year" xpText0))
       (xpOption (xpElem "license" xpText0)))

instance XmlPickler Copyright where
  xpickle =
    xpCopyright
