module Data.Geo.GPX.Lens.CmtL where

import Data.Lens.Common

class CmtL a where
  cmtL :: Lens a (Maybe String)

