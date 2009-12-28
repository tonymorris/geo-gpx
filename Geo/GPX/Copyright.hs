module Geo.GPX.Copyright where

import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

data Copyright = Copyright String [String] [String]
  deriving Eq

copyright :: String -> [String] -> [String] -> Copyright
copyright = Copyright

instance XmlPickler Copyright where
  xpickle = undefined

instance Show Copyright where
  show = showPickled []
