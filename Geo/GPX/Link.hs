module Geo.GPX.Link where

data Link = Link String (Maybe String) (Maybe String)  deriving Eq

link :: String -> Maybe String -> Maybe String -> Link
link = Link
