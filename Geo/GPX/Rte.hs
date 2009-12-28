module Geo.GPX.Rte where

import Geo.GPX.Wpt
import Geo.GPX.Extensions
import Geo.GPX.Link

data Rte = Rte (Maybe String) (Maybe String) (Maybe String) [Link] (Maybe Int) (Maybe String) (Maybe Extensions) [Wpt]
  deriving Eq

rte :: Maybe String
    -> Maybe String
    -> Maybe String
    -> [Link]
    -> Maybe Int
    -> Maybe String
    -> Maybe Extensions
    -> [Wpt]
    -> Rte
rte a b c d e = Rte a b c d (fmap abs e)
