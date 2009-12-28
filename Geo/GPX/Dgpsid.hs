module Geo.GPX.Dgpsid where

import Text.XML.HXT.Extras
import Text.XML.HXT.Arrow
import Data.Ix

newtype Dgpsid = Dgpsid Int
  deriving Eq

dgpsid :: Int -> Dgpsid
dgpsid n = if n >= 0 && n <= 1023 then Dgpsid n else error ("0 <= " ++ show n ++ " <= 1023")

instance XmlPickler Dgpsid where
  xpickle = xpElem "dgpsid" (xpWrapMaybe (\n -> if inRange (0, 1023) n then Just (dgpsid n) else Nothing, \(Dgpsid n) -> n) (xpickle :: PU Int))

instance Show Dgpsid where
  show = showPickled []
