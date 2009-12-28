module Geo.GPX.Extensions where

import Text.XML.HXT.Arrow

newtype Extensions = Extensions XmlTree
  deriving (Eq, Show)

instance XmlPickler Extensions where
  xpickle = xpWrap (Extensions, \(Extensions t) -> t) (xpElem "extensions" xpTree)
