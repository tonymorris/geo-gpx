{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses #-}

-- | Complex Type: @ptsegType@ <http://www.topografix.com/GPX/1/1/#type_ptsegType>
module Data.Geo.GPX.Type.Ptseg(
  Ptseg
, ptseg
, runPtseg
) where

import Data.Geo.GPX.Type.Pt
import Control.Newtype
-- import Text.XML.HXT.Arrow.Pickle

newtype Ptseg = Ptseg [Pt]
  deriving Eq

ptseg ::
  [Pt] -- ^ The points (pt).
  -> Ptseg
ptseg =
  Ptseg

runPtseg ::
  Ptseg
  -> [Pt]
runPtseg (Ptseg p) =
  p

{-
instance XmlPickler Ptseg where
  xpickle =
    xpWrap (ptseg, \(Ptseg k) -> k) (xpList (xpElem "pt" xpickle))
-}

instance Newtype Ptseg [Pt] where
  pack = 
    Ptseg
  unpack (Ptseg x) =
    x

