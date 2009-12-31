{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances  #-}

-- | Complex Type: @metadataType@ <http://www.topografix.com/GPX/1/1/#type_metadataType>
module Data.Geo.GPX.MetadataType(
                                  MetadataType,
                                  metadataType
                                ) where

import Data.Geo.GPX.PersonType
import Data.Geo.GPX.CopyrightType
import Data.Geo.GPX.LinkType
import Data.Geo.GPX.BoundsType
import Data.Geo.GPX.ExtensionsType
import Data.Geo.GPX.Accessor.Name
import Data.Geo.GPX.Accessor.Desc
import Data.Geo.GPX.Accessor.Author
import Data.Geo.GPX.Accessor.Copyright
import Data.Geo.GPX.Accessor.Links
import Data.Geo.GPX.Accessor.Time
import Data.Geo.GPX.Accessor.Keywords
import Data.Geo.GPX.Accessor.Bounds
import Data.Geo.GPX.Accessor.Extensions
import Text.XML.HXT.Arrow
import Text.XML.HXT.Extras
import Text.XML.XSD.DateTime

data MetadataType = MetadataType (Maybe String) (Maybe String) (Maybe PersonType) (Maybe CopyrightType) [LinkType] (Maybe DateTime) (Maybe String) (Maybe BoundsType) (Maybe ExtensionsType)
  deriving (Eq, Show)

metadataType :: Maybe String -- ^ The name.
                -> Maybe String -- ^ The desc.
                -> Maybe PersonType -- ^ The author.
                -> Maybe CopyrightType -- ^ The copyright.
                -> [LinkType] -- ^ The links (link).
                -> Maybe DateTime -- ^ The time.
                -> Maybe String -- ^ The keywords.
                -> Maybe BoundsType -- ^ The bounds.
                -> Maybe ExtensionsType -- ^ The extensions
                -> MetadataType
metadataType = MetadataType

instance XmlPickler MetadataType where
  xpickle = xpWrap (\(a, b, c, d, e, f, g, h, i) -> metadataType a b c d e f g h i, \(MetadataType a b c d e f g h i) -> (a, b, c, d, e, f, g, h, i)) (xp9Tuple
              (xpOption (xpElem "name" xpText))
              (xpOption (xpElem "desc" xpText))
              (xpOption (xpElem "author" xpickle))
              (xpOption (xpElem "copyright" xpickle))
              (xpList (xpElem "link" xpickle))
              (xpOption (xpElem "time" (xpWrapMaybe (dateTime, show) xpText)))
              (xpOption (xpElem "keywords" xpText))
              (xpOption (xpElem "bounds" xpickle))
              (xpOption (xpElem "extensions" xpickle)))

instance Name MetadataType where
  name (MetadataType x _ _ _ _ _ _ _ _) = x

instance Desc MetadataType where
  desc (MetadataType _ x _ _ _ _ _ _ _) = x

instance Author MetadataType (Maybe PersonType) where
  author (MetadataType _ _ x _ _ _ _ _ _) = x

instance Copyright MetadataType where
  copyright (MetadataType _ _ _ x _ _ _ _ _) = x

instance Links MetadataType where
  links (MetadataType _ _ _ _ x _ _ _ _) = x

instance Time MetadataType where
  time (MetadataType _ _ _ _ _ x _ _ _) = x

instance Keywords MetadataType where
  keywords (MetadataType _ _ _ _ _ _ x _ _) = x

instance Bounds MetadataType where
  bounds (MetadataType _ _ _ _ _ _ _ x _) = x

instance Extensions MetadataType where
  extensions (MetadataType _ _ _ _ _ _ _ _ x) = x
