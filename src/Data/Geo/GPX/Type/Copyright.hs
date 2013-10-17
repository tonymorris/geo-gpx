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
         (xpAttr "author" xpText)
         (xpOption (xpElem "year" xpText))
         (xpOption (xpElem "license" xpText))))

instance XmlPickler Copyright where
  xpickle =
    xpCopyright