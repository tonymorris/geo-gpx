module Geo.GPX.CopyrightType where

import Text.XML.HXT.Arrow

data CopyrightType = CopyrightType String (Maybe String) (Maybe String)
  deriving (Eq, Show)

copyrightType :: String -> Maybe String -> Maybe String -> CopyrightType
copyrightType = CopyrightType

instance XmlPickler CopyrightType where
  xpickle = xpWrap (\(author, year, license) -> copyrightType author year license, undefined) (xpTriple
              (xpAttr "author" xpText)
              (xpOption (xpElem "year" xpText))
              (xpOption (xpElem "license" xpText)))
