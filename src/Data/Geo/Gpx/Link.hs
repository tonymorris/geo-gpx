{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}

-- | Complex Type: @linkType@ <http://www.topografix.com/GPX/1/1/#type_linkType>
module Data.Geo.Gpx.Link(
  Link
, link
) where

import Text.XML.HXT.Core(XmlPickler(..), PU, xpAttr, xpElem, xpText0, xpOption, xpWrap, xpTriple)
import Control.Lens(makeClassy)
import Prelude(Eq, Ord, Show, String, Maybe(..))

data Link =
  Link {
    _href :: String
  , _text :: Maybe String
  , _tyype :: Maybe String
  } deriving (Eq, Ord)

makeClassy ''Link

{-
instance HrefL Link where
  hrefL =
    Lens $ \(Link href text typ) -> store (\href -> Link href text typ) href

instance TextL Link where
  textL =
    Lens $ \(Link href text typ) -> store (\text -> Link href text typ) text

instance TypeL Link where
  typeL =
    Lens $ \(Link href text typ) -> store (\typ -> Link href text typ) typ
-}

{-
instance XmlPickler Link where
  xpickle =
    xpWrap (\(href, text, type') -> link href text type', \(Link href text type') -> (href, text, type')) (xpTriple
           (xpAttr "href" xpText)
           (xpOption (xpElem "text" xpText))
           (xpOption (xpElem "type" xpText)))
-}
