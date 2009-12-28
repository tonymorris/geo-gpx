{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances, TypeSynonymInstances #-}

module Data.Geo.GPX.CopyrightType where

import Data.Geo.GPX.Accessor.Author
import Data.Geo.GPX.Accessor.Year
import Data.Geo.GPX.Accessor.License
import Text.XML.HXT.Arrow

data CopyrightType = CopyrightType String (Maybe String) (Maybe String)
  deriving (Eq, Show)

copyrightType :: String -> Maybe String -> Maybe String -> CopyrightType
copyrightType = CopyrightType

instance XmlPickler CopyrightType where
  xpickle = xpWrap (\(author', year', license') -> copyrightType author' year' license', \(CopyrightType author' year' license') -> (author', year', license')) (xpTriple
              (xpAttr "author" xpText)
              (xpOption (xpElem "year" xpText))
              (xpOption (xpElem "license" xpText)))

instance Author CopyrightType String where
  author (CopyrightType x _ _) = x

instance Year CopyrightType where
  year (CopyrightType _ x _) = x

instance License CopyrightType where
  license (CopyrightType _ _ x) = x
