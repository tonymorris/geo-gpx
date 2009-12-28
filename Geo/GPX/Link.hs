module Geo.GPX.Link where

import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

data Link = Link String (Maybe String) (Maybe String)  deriving Eq

link :: String -> Maybe String -> Maybe String -> Link
link = Link

instance XmlPickler Link where
  xpickle = undefined

instance Show Link where
  show = showPickled []
