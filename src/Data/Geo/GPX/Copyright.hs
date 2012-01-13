{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances, TypeSynonymInstances #-}

-- | Complex Type: @copyrightType@ <http://www.topografix.com/GPX/1/1/#type_copyrightType>
module Data.Geo.GPX.Copyright(
  Copyright
, copyright
) where

import Data.Geo.GPX.Lens.AuthorL
import Data.Geo.GPX.Lens.YearL
import Data.Geo.GPX.Lens.LicenseL
import Data.Lens.Common
import Control.Comonad.Trans.Store
import Text.XML.HXT.Arrow

data Copyright = Copyright String (Maybe String) (Maybe String)
  deriving (Eq, Ord)

copyright
  :: String -- ^ The author.
  -> Maybe String -- ^ The year.
  -> Maybe String -- ^ The license.
  -> Copyright
copyright =
  Copyright

instance AuthorL Copyright String where
  authorL =
    Lens $ \(Copyright author year license) -> store (\author -> Copyright author year license) author

instance YearL Copyright where
  yearL =
    Lens $ \(Copyright author year license) -> store (\year -> Copyright author year license) year

instance LicenseL Copyright where
  licenseL =
    Lens $ \(Copyright author year license) -> store (\license -> Copyright author year license) license

instance XmlPickler Copyright where
  xpickle =
    xpWrap (\(author', year', license') -> copyright author' year' license', \(Copyright author' year' license') -> (author', year', license')) (xpTriple
           (xpAttr "author" xpText)
           (xpOption (xpElem "year" xpText))
           (xpOption (xpElem "license" xpText)))
