module Data.Geo.GPX.Accessor.Copyright where

import Data.Geo.GPX.CopyrightType
import Data.Geo.GPX.Accessor.Accessor

class Copyright a where
  copyright :: a -> Maybe CopyrightType
  setCopyright :: Maybe CopyrightType -> a -> a

  setCopyright' :: CopyrightType -> a -> a
  setCopyright' = setCopyright . Just

  usingCopyright :: a -> (Maybe CopyrightType -> Maybe CopyrightType) -> a
  usingCopyright = copyright `using` setCopyright
