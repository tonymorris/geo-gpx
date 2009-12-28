module Geo.GPX.Link where

import Text.XML.HXT.Arrow

data Link = Link String (Maybe String) (Maybe String)
  deriving (Eq, Show)

link :: String -> Maybe String -> Maybe String -> Link
link = Link

instance XmlPickler Link where
  xpickle = undefined
