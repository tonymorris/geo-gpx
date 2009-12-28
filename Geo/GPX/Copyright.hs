module Geo.GPX.Copyright where

data Copyright = Copyright String [String] [String]
  deriving Eq

copyright :: String -> [String] -> [String] -> Copyright
copyright = Copyright
