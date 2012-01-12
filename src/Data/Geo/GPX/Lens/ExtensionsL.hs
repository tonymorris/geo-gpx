module Data.Geo.GPX.Lens.ExtensionsL where

import Data.Geo.GPX.Extensions
import Data.Lens.Common

class ExtensionsL a where
  extensionsL :: Lens a (Maybe Extensions)

