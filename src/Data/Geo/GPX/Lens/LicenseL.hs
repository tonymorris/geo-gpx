module Data.Geo.GPX.Lens.LicenseL where

import Data.Lens.Common

class LicenseL a where
  licenseL :: Lens a (Maybe String)

