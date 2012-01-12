module Data.Geo.GPX.Lens.KeywordsL where

import Data.Lens.Common

class KeywordsL a where
  keywordsL :: Lens a (Maybe String)

