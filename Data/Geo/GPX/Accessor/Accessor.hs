module Data.Geo.GPX.Accessor.Accessor(
                                       using
                                     ) where

using :: (a -> d) -> (c -> a -> b) -> (d -> c) -> a -> b
using f g = flip (flip =<< (g .) . flip id . f)
