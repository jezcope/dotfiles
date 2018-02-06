{-# LANGUAGE DeriveGeneric #-}

module Colors (walColor, onedarkColor) where

import GHC.Generics
import System.IO.Unsafe
import System.Environment
import Data.Aeson
import qualified Data.ByteString.Lazy as B
import qualified Data.Map as M

data WalColors = WalColors {
    wallpaper :: String
  , alpha :: String
  , special :: M.Map String String
  , colors :: M.Map String String
  } deriving (Generic, Show)

instance FromJSON WalColors

-- Taken from https://github.com/tilal6991/base16-onedark-scheme
onedarkColor :: String -> String
onedarkColor "color0" = "#282c34"
onedarkColor "color1" = "#353b45"
onedarkColor "color2" = "#3e4451"
onedarkColor "color3" = "#545862"
onedarkColor "color4" = "#565c64"
onedarkColor "color5" = "#abb2bf"
onedarkColor "color6" = "#b6bdca"
onedarkColor "color7" = "#c8ccd4"
onedarkColor "color8" = "#e06c75"
onedarkColor "color9" = "#d19a66"
onedarkColor "color10" = "#e5c07b"
onedarkColor "color11" = "#98c379"
onedarkColor "color12" = "#56b6c2"
onedarkColor "color13" = "#61afef"
onedarkColor "color14" = "#c678dd"
onedarkColor "color15" = "#be5046"
onedarkColor c = error $ "Unrecognized color " ++ c

fallbackColor = onedarkColor

colorDataPath = "/.cache/wal/colors.json"

loadColorData :: IO (Maybe WalColors)
loadColorData = do
  home <- getEnv "HOME"
  colorData <- B.readFile $ home ++ colorDataPath
  return $ decode colorData

{-# NOINLINE walColor #-}
walColor :: String -> String
walColor cRef = case unsafePerformIO loadColorData of
  Nothing -> error "Unable to load color data"
  Just config -> case M.lookup cRef $ colors config of
    Just c -> c
    Nothing -> fallbackColor cRef
