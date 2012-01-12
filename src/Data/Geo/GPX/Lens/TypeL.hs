module Data.Geo.GPX.Lens.TypeL where

import Data.Lens.Common

class TypeL a where
  typeL :: Lens a (Maybe String)

