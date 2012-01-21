module Data.Geo.GPX.Lens.EmailL where

import Data.Geo.GPX.Type.Email
import Data.Lens.Common

class EmailL a where
  emailL :: Lens a (Maybe Email)

