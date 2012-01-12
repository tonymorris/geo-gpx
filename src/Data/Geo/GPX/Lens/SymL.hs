module Data.Geo.GPX.Lens.SymL where

import Data.Lens.Common

class SymL a where
  symL :: Lens a (Maybe String)

