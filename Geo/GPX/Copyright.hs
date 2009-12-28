module Geo.GPX.Copyright where

import Text.XML.HXT.Arrow

data Copyright = Copyright String [String] [String]
  deriving (Eq, Show)

copyright :: String -> [String] -> [String] -> Copyright
copyright = Copyright

instance XmlPickler Copyright where
  xpickle = undefined
