module Data.Geo.GPX.Lens.VersionL where

import Data.Lens.Common

class VersionL a where
  versionL :: Lens a String

