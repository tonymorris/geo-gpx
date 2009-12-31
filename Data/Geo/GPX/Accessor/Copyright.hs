module Data.Geo.GPX.Accessor.Copyright where

import Data.Geo.GPX.CopyrightType

class Copyright a where
  copyright :: a -> Maybe CopyrightType
  setCopyright :: Maybe CopyrightType -> a -> a
