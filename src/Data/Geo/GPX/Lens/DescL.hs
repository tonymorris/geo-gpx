module Data.Geo.GPX.Lens.DescL where

import Data.Lens.Common

class DescL a where
  descL :: Lens a (Maybe String)

