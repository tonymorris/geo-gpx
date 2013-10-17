-- | Complex Type: @copyrightType@ <http://www.topografix.com/GPX/1/1/#type_copyrightType>
module Data.Geo.GPX.Type.Copyright(
  Copyright
, copyright
, xpCopyright
) where

import Text.XML.HXT.Core

data Copyright = Copyright String (Maybe String) (Maybe String)
  deriving (Eq, Ord, Show)

copyright
  :: String -- ^ The author.
  -> Maybe String -- ^ The year.
  -> Maybe String -- ^ The license.
  -> Copyright
copyright =
  Copyright

-- | Pickler for @Copyright@.
--
-- >>> fmap (unpickleDoc' xpCopyright) (runLA xread "<copyright author=\"Bob\"><year>2010</year><license>BSD3</license></copyright>")
-- [Right (Copyright "Bob" (Just "2010") (Just "BSD3"))]
--
-- >>> any (either (const False) (const True) . unpickleDoc' xpCopyright) (runLA xread "<copyright><year>2010</year><license>BSD3</license></copyright>")
-- False
--
-- >>> fmap (unpickleDoc' xpCopyright) (runLA xread "<copyright author=\"Bob\"><year>2010</year></copyright>")
-- [Right (Copyright "Bob" (Just "2010") Nothing)]
--
-- >>> fmap (unpickleDoc' xpCopyright) (runLA xread "<copyright author=\"Bob\"><license>BSD3</license></copyright>")
-- [Right (Copyright "Bob" Nothing (Just "BSD3"))]
--
-- >>> fmap (unpickleDoc' xpCopyright) (runLA xread "<copyright author=\"Bob\"></copyright>")
-- [Right (Copyright "Bob" Nothing Nothing)]
--
-- >>> fmap (unpickleDoc' xpCopyright) (runLA xread "<copyright author=\"\"><year>2010</year><license>BSD3</license></copyright>")
-- [Right (Copyright "" (Just "2010") (Just "BSD3"))]
--
-- >>> fmap (unpickleDoc' xpCopyright) (runLA xread "<copyright author=\"Bob\"><year></year><license>BSD3</license></copyright>")
-- [Right (Copyright "Bob" (Just "") (Just "BSD3"))]
--
-- >>> fmap (unpickleDoc' xpCopyright) (runLA xread "<copyright author=\"Bob\"><year>2010</year><license></license></copyright>")
-- [Right (Copyright "Bob" (Just "2010") (Just ""))]
--
-- >>> any (either (const False) (const True) . unpickleDoc' xpCopyright) (runLA xread "<copyright author=\"Bob\"><x>x</x></copyright>")
-- False
xpCopyright ::
  PU Copyright
xpCopyright =
   xpWrap
     (
       \(author', year', license') -> copyright author' year' license'
     , \(Copyright author' year' license') -> (author', year', license')
     )
     (xpElem "copyright"
       (xpTriple
         (xpAttr "author" xpText0)
         (xpOption (xpElem "year" xpText0))
         (xpOption (xpElem "license" xpText0))))

instance XmlPickler Copyright where
  xpickle =
    xpCopyright
