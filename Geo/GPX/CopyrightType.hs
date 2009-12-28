module Geo.GPX.CopyrightType where

import Text.XML.HXT.Arrow

data CopyrightType = CopyrightType String [String] [String]
  deriving (Eq, Show)

copyrightType :: String -> [String] -> [String] -> CopyrightType
copyrightType = CopyrightType

instance XmlPickler CopyrightType where
  xpickle = undefined
