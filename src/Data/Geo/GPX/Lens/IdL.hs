module Data.Geo.GPX.Lens.IdL where

import Data.Lens.Common
import Prelude hiding (id)

class IdL a where
  idL :: Lens a String

