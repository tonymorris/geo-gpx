-- | Complex Type: @metadataType@ <http://www.topografix.com/GPX/1/1/#type_metadataType>
module Data.Geo.GPX.Metadata(
  Metadata
, metadata
) where

import Data.Geo.GPX.Person
import Data.Geo.GPX.Copyright
import Data.Geo.GPX.Link
import Data.Geo.GPX.Bounds
import Data.Geo.GPX.Extensions
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras
import Text.XML.XSD.DateTime

data Metadata = Metadata (Maybe String) (Maybe String) (Maybe Person) (Maybe Copyright) [Link] (Maybe DateTime) (Maybe String) (Maybe Bounds) (Maybe Extensions)
  deriving (Eq, Ord)

metadata ::
  Maybe String -- ^ The name.
  -> Maybe String -- ^ The desc.
  -> Maybe Person -- ^ The author.
  -> Maybe Copyright -- ^ The copyright.
  -> [Link] -- ^ The links (link).
  -> Maybe DateTime -- ^ The time.
  -> Maybe String -- ^ The keywords.
  -> Maybe Bounds -- ^ The bounds.
  -> Maybe Extensions -- ^ The extensions
  -> Metadata
metadata =
  Metadata

