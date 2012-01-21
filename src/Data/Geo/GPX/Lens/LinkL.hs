module Data.Geo.GPX.Lens.LinkL where

import Data.Geo.GPX.Type.Link
import Data.Lens.Common

class LinkL a where
  linkL :: Lens a (Maybe Link)

