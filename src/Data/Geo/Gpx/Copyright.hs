{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}

-- | Complex Type: @copyrightType@ <http://www.topografix.com/GPX/1/1/#type_copyrightType>
module Data.Geo.Gpx.Copyright(
  Copyright(..)
, xpCopyrightElem
, xpCopyright
, author
, year
, license
) where

import Text.XML.HXT.Core
import Control.Lens

-- $setup
-- >>> let unpickleCopyrightElem = fmap (unpickleDoc' xpCopyrightElem) . runLA xread
-- >>> let allFailedCopyrightElem = all (either (const False) (const True) . unpickleDoc' xpCopyrightElem) . runLA xread

data Copyright =
  Copyright {
    _author :: String
  , _year :: Maybe String
  , _license :: Maybe String
  } deriving (Eq, Ord)

instance Show Copyright where
  show (Copyright a y l) =
    concat
      [
        "Copyright {author=\""
      , a
      , "\""
      , maybe [] (\y' -> ", year=\"" ++ y' ++ "\"") y
      , maybe [] (\l' -> ", license=\"" ++ l' ++ "\"") l
      , "}"
      ]

makeClassy ''Copyright

-- | Pickler for @Copyright@.
--
-- >>> unpickleCopyrightElem "<copyright author=\"Bob\"><year>2010</year><license>BSD3</license></copyright>"
-- [Right Copyright {author="Bob", year="2010", license="BSD3"}]
--
-- >>> allFailedCopyrightElem "<copyright><year>2010</year><license>BSD3</license></copyright>"
-- False
--
-- >>> unpickleCopyrightElem "<copyright author=\"Bob\"><year>2010</year></copyright>"
-- [Right Copyright {author="Bob", year="2010"}]
--
-- >>> unpickleCopyrightElem "<copyright author=\"Bob\"><license>BSD3</license></copyright>"
-- [Right Copyright {author="Bob", license="BSD3"}]
--
-- >>> unpickleCopyrightElem "<copyright author=\"Bob\"></copyright>"
-- [Right Copyright {author="Bob"}]
--
-- >>> unpickleCopyrightElem "<copyright author=\"\"><year>2010</year><license>BSD3</license></copyright>"
-- [Right Copyright {author="", year="2010", license="BSD3"}]
--
-- >>> unpickleCopyrightElem "<copyright author=\"Bob\"><year></year><license>BSD3</license></copyright>"
-- [Right Copyright {author="Bob", year="", license="BSD3"}]
--
-- >>> unpickleCopyrightElem "<copyright author=\"Bob\"><year>2010</year><license></license></copyright>"
-- [Right Copyright {author="Bob", year="2010", license=""}]
--
-- >>> allFailedCopyrightElem "<copyright author=\"Bob\"><x>x</x></copyright>"
-- False
xpCopyrightElem ::
  PU Copyright
xpCopyrightElem =
   xpElem "copyright"
     xpCopyright

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
