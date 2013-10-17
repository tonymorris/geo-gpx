{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances, TypeSynonymInstances #-}

-- | Complex Type: @gpxType@ <http://www.topografix.com/GPX/1/1/#type_gpxType>
module Data.Geo.Gpx.Gpx(
  Gpx
, GpxP(..)
) where

import Data.Geo.Gpx.Metadata
import Data.Geo.Gpx.Wpt
import Data.Geo.Gpx.Rte
import Data.Geo.Gpx.Trk
import Data.Geo.Gpx.Extensions

data Gpx = Gpx String String (Maybe Metadata) [Wpt] [Rte] [Trk] (Maybe Extensions)
  deriving Eq

class GpxP g where
  gpx ::
    String -- ^ The version.
    -> String -- ^ The creator.
    -> Maybe Metadata -- ^ The metadata.
    -> [Wpt] -- ^ The waypoints (wpt).
    -> [Rte] -- ^ The routes (rte).
    -> [Trk] -- ^ The tracks (trk).
    -> Maybe Extensions -- ^ The extensions.
    -> g

instance GpxP Gpx where
  gpx =
    Gpx

{-
instance VersionL Gpx where
  versionL =
    Lens $ \(Gpx version creator metadata wpts rtes trks extensions) -> store (\version -> Gpx version creator metadata wpts rtes trks extensions) version

instance CreatorL Gpx where
  creatorL =
    Lens $ \(Gpx version creator metadata wpts rtes trks extensions) -> store (\creator -> Gpx version creator metadata wpts rtes trks extensions) creator

instance MetadataL Gpx where
  metadataL =
    Lens $ \(Gpx version creator metadata wpts rtes trks extensions) -> store (\metadata -> Gpx version creator metadata wpts rtes trks extensions) metadata

instance WptsL Gpx where
  wptsL =
    Lens $ \(Gpx version creator metadata wpts rtes trks extensions) -> store (\wpts -> Gpx version creator metadata wpts rtes trks extensions) wpts

instance RtesL Gpx where
  rtesL =
    Lens $ \(Gpx version creator metadata wpts rtes trks extensions) -> store (\rtes -> Gpx version creator metadata wpts rtes trks extensions) rtes

instance TrksL Gpx where
  trksL =
    Lens $ \(Gpx version creator metadata wpts rtes trks extensions) -> store (\trks -> Gpx version creator metadata wpts rtes trks extensions) trks

instance ExtensionsL Gpx where
  extensionsL =
    Lens $ \(Gpx version creator metadata wpts rtes trks extensions) -> store (\extensions -> Gpx version creator metadata wpts rtes trks extensions) extensions
-}

{-
instance XmlPickler Gpx where
  xpickle =
    xpWrap (\(version', creator', metadata', wpt', rte', trk', extensions') -> gpx version' creator' metadata' wpt' rte' trk' extensions',
              \(Gpx version' creator' metadata' wpt' rte' trk' extensions') -> (version', creator', metadata', wpt', rte', trk', extensions')) (xp7Tuple
                (xpAttr "version" xpText)
                (xpAttr "creator" xpText)
                (xpOption (xpElem "metadata" xpickle))
                (xpList (xpElem "wpt" xpickle))
                (xpList (xpElem "rte" xpickle))
                (xpList (xpElem "trk" xpickle))
                (xpOption (xpElem "extensions" xpickle)))
-}
