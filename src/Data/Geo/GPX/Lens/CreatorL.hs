module Data.Geo.GPX.Lens.CreatorL where

import Data.Lens.Common

class CreatorL a where
  creatorL :: Lens a String

