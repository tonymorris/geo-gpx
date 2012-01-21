module Data.Geo.GPX.Lens.CopyrightL where

import Data.Geo.GPX.Type.Copyright
import Data.Lens.Common

class CopyrightL a where
  copyrightL :: Lens a (Maybe Copyright)

