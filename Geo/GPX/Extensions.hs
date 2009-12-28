module Geo.GPX.Extensions where

import Text.XML.HXT.Arrow

newtype Extensions = Extensions XmlTree
  deriving Eq

instance XmlPickler Extensions where
  xpickle = xpWrap (Extensions, \(Extensions t) -> t) (xpElem "extensions" xpTree)
