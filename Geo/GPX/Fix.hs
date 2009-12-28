module Geo.GPX.Fix where

import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow

data Fix = None | Twod | Threed | Dgps | Pps
  deriving (Eq, Enum)

foldFix :: a -> a -> a -> a -> a -> Fix -> a
foldFix n _ _ _ _ None = n
foldFix _ t _ _ _ Twod = t
foldFix _ _ t _ _ Threed = t
foldFix _ _ _ d _ Dgps = d
foldFix _ _ _ _ p Pps = p

none :: Fix
none = None

twod :: Fix
twod = Twod

threed :: Fix
threed = Threed

dgps :: Fix
dgps = Dgps

pps :: Fix
pps = Pps

fix :: String -> Maybe Fix
fix "none" = Just Geo.GPX.Fix.none
fix "2d"= Just twod
fix "3d" = Just threed
fix "dgps" = Just dgps
fix "pps" = Just pps
fix _ = Nothing

fix' :: Fix -> String
fix' = foldFix "none" "2d" "3d" "dgps" "pps"

instance XmlPickler Fix where
  xpickle = xpElem "fix" (xpWrapMaybe (fix, fix') xpText)

instance Show Fix where
  show = showPickled []
