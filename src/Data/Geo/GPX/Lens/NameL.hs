module Data.Geo.GPX.Lens.NameL where

import Data.Lens.Common

class NameL a where
  nameL :: Lens a (Maybe String)

