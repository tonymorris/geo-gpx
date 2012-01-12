module Data.Geo.GPX.Lens.SrcL where

import Data.Lens.Common

class SrcL a where
  srcL :: Lens a (Maybe String)

