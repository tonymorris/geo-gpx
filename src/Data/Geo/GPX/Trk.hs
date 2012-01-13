-- | Complex Type: @trkType@ <http://www.topografix.com/GPX/1/1/#type_trkType>
module Data.Geo.GPX.Trk(
  Trk
, trk
) where

import Data.Geo.GPX.Trkseg
import Data.Geo.GPX.Extensions
import Data.Geo.GPX.Link
import Data.Geo.GPX.Lens.NameL
import Data.Geo.GPX.Lens.CmtL
import Data.Geo.GPX.Lens.DescL
import Data.Geo.GPX.Lens.SrcL
import Data.Geo.GPX.Lens.LinksL
import Data.Geo.GPX.Lens.NumberL
import Data.Geo.GPX.Lens.TypeL
import Data.Geo.GPX.Lens.ExtensionsL
import Data.Geo.GPX.Lens.TrksegsL
import Data.Lens.Common
import Control.Comonad.Trans.Store
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras

data Trk = Trk (Maybe String) (Maybe String) (Maybe String) (Maybe String) [Link] (Maybe Int) (Maybe String) (Maybe Extensions) [Trkseg]
  deriving (Eq, Ord)

trk ::
  Maybe String -- ^ The name.
  -> Maybe String -- ^ The cmt.
  -> Maybe String -- ^ The desc.
  -> Maybe String -- ^ The src.
  -> [Link] -- ^ The links (link).
  -> Maybe Int -- ^ The number.
  -> Maybe String -- ^ The type.
  -> Maybe Extensions -- ^ The extensions.
  -> [Trkseg] -- ^ The track segments (trkseg).
  -> Trk
trk a b c d e f =
  Trk a b c d e (fmap abs f)

instance NameL Trk where
  nameL =
    Lens $ \(Trk name cmt desc src links number typ extensions trksegs) -> store (\name -> Trk name cmt desc src links number typ extensions trksegs) name

instance CmtL Trk where
  cmtL =
    Lens $ \(Trk name cmt desc src links number typ extensions trksegs) -> store (\cmt -> Trk name cmt desc src links number typ extensions trksegs) cmt

instance DescL Trk where
  descL =
    Lens $ \(Trk name cmt desc src links number typ extensions trksegs) -> store (\desc -> Trk name cmt desc src links number typ extensions trksegs) desc

instance SrcL Trk where
  srcL =
    Lens $ \(Trk name cmt desc src links number typ extensions trksegs) -> store (\src -> Trk name cmt desc src links number typ extensions trksegs) src

instance LinksL Trk where
  linksL =
    Lens $ \(Trk name cmt desc src links number typ extensions trksegs) -> store (\links -> Trk name cmt desc src links number typ extensions trksegs) links

instance NumberL Trk where
  numberL =
    Lens $ \(Trk name cmt desc src links number typ extensions trksegs) -> store (\number -> Trk name cmt desc src links number typ extensions trksegs) number

instance TypeL Trk where
  typeL =
    Lens $ \(Trk name cmt desc src links number typ extensions trksegs) -> store (\typ -> Trk name cmt desc src links number typ extensions trksegs) typ

instance ExtensionsL Trk where
  extensionsL =
    Lens $ \(Trk name cmt desc src links number typ extensions trksegs) -> store (\extensions -> Trk name cmt desc src links number typ extensions trksegs) extensions

instance TrksegsL Trk where
  trksegsL =
    Lens $ \(Trk name cmt desc src links number typ extensions trksegs) -> store (\trksegs -> Trk name cmt desc src links number typ extensions trksegs) trksegs

