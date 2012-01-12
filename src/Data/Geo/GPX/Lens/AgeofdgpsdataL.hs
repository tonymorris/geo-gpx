module Data.Geo.GPX.Lens.AgeofdgpsdataL where

import Data.Lens.Common

class AgeofdgpsdataL a where
  ageofdgpsdataL :: Lens a (Maybe Double)

