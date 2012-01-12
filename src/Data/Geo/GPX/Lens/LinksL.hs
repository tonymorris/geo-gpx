module Data.Geo.GPX.Lens.LinksL where

import Data.Geo.GPX.Link
import Data.Lens.Common

class LinksL a where
  linksL :: Lens a [Link]

