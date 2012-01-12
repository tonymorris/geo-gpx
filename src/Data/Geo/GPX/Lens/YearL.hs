module Data.Geo.GPX.Lens.YearL where

import Data.Lens.Common

class YearL a where
  yearL :: Lens a (Maybe String)

