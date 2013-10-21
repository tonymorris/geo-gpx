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
, author'
, year'
, license'
, copyright'
) where

import Text.XML.HXT.Core(XmlPickler(..), PU, xpAttr, xpElem, xpText0, xpOption, xpWrap, xpTriple)
import Control.Lens(makeClassy, Prism', prism')
import Prelude(Maybe(..), String, Eq, Ord, Show, fmap)
import Control.Applicative((<$), (<$>), Applicative(..))

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

author' ::
  Prism' Copyright String
author' =
  prism'
    (\a -> Copyright a Nothing Nothing)
    (\(Copyright a y l) -> a <$ y <* l)

year' ::
  Prism' Copyright (String, String, Maybe String)
year' =
  prism'
    (\(a, y, l) -> Copyright a (Just y) l)
    (\(Copyright a y l) -> fmap (\y' -> (a, y', l)) y)

license' ::
  Prism' Copyright (String, Maybe String, String)
license' =
  prism'
    (\(a, y, l) -> Copyright a y (Just l))
    (\(Copyright a y l) -> fmap (\l' -> (a, y, l')) l)

copyright' ::
  Prism' Copyright (String, String, String)
copyright' =
  prism'
    (\(a, y, l) -> Copyright a (Just y) (Just l))
    (\(Copyright a y l) -> (\y' l' -> (a, y', l')) <$> y <*> l)

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
       \(a', y', l') -> Copyright a' y' l'
     , \(Copyright a' y' l') -> (a', y', l')
     )
     (xpTriple
       (xpAttr "author" xpText0)
       (xpOption (xpElem "year" xpText0))
       (xpOption (xpElem "license" xpText0)))

instance XmlPickler Copyright where
  xpickle =
    xpCopyright
