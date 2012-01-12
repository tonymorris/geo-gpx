module Data.Geo.GPX.Lens.TextL where

import Data.Lens.Common

class TextL a where
  textL :: Lens a (Maybe String)

