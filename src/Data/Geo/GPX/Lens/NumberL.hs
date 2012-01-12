module Data.Geo.GPX.Lens.NumberL where

import Data.Lens.Common

class NumberL a where
  numberL :: Lens a (Maybe Int)

