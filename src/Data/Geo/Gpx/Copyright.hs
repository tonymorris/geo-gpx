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

data Copyright =
  Copyright {
    _copyrightAuthor :: String
  , _copyrightYear :: Maybe String
  , _copyrightLicense :: Maybe String
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

makeFields ''Copyright

-- | Pickler for @Copyright@.
--
-- >>> fmap (unpickleDoc' xpCopyrightElem) (runLA xread "<copyright author=\"Bob\"><year>2010</year><license>BSD3</license></copyright>")
-- [Right Copyright {author="Bob", year="2010", license="BSD3"}]
--
-- >>> any (either (const False) (const True) . unpickleDoc' xpCopyrightElem) (runLA xread "<copyright><year>2010</year><license>BSD3</license></copyright>")
-- False
--
-- >>> fmap (unpickleDoc' xpCopyrightElem) (runLA xread "<copyright author=\"Bob\"><year>2010</year></copyright>")
-- [Right Copyright {author="Bob", year="2010"}]
--
-- >>> fmap (unpickleDoc' xpCopyrightElem) (runLA xread "<copyright author=\"Bob\"><license>BSD3</license></copyright>")
-- [Right Copyright {author="Bob", license="BSD3"}]
--
-- >>> fmap (unpickleDoc' xpCopyrightElem) (runLA xread "<copyright author=\"Bob\"></copyright>")
-- [Right Copyright {author="Bob"}]
--
-- >>> fmap (unpickleDoc' xpCopyrightElem) (runLA xread "<copyright author=\"\"><year>2010</year><license>BSD3</license></copyright>")
-- [Right Copyright {author="", year="2010", license="BSD3"}]
--
-- >>> fmap (unpickleDoc' xpCopyrightElem) (runLA xread "<copyright author=\"Bob\"><year></year><license>BSD3</license></copyright>")
-- [Right Copyright {author="Bob", year="", license="BSD3"}]
--
-- >>> fmap (unpickleDoc' xpCopyrightElem) (runLA xread "<copyright author=\"Bob\"><year>2010</year><license></license></copyright>")
-- [Right Copyright {author="Bob", year="2010", license=""}]
--
-- >>> any (either (const False) (const True) . unpickleDoc' xpCopyrightElem) (runLA xread "<copyright author=\"Bob\"><x>x</x></copyright>")
-- False
xpCopyrightElem ::
  PU Copyright
xpCopyrightElem =
   xpElem "copyright"
     (xpWrap
       (
         \(author', year', license') -> Copyright author' year' license'
       , \(Copyright author' year' license') -> (author', year', license')
       )
       (xpTriple
         (xpAttr "author" xpText0)
         (xpOption (xpElem "year" xpText0))
         (xpOption (xpElem "license" xpText0))))

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
