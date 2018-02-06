{-# LANGUAGE DeriveGeneric #-}

module Colors (walColor) where

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

colorDataPath = "/.cache/wal/colors.json"

loadColorData :: IO (Maybe WalColors)
loadColorData = do
  home <- getEnv "HOME"
  colorData <- B.readFile $ home ++ colorDataPath
  return $ decode colorData

{-# NOINLINE walColor #-}
walColor :: String -> String
walColor cref = case unsafePerformIO loadColorData of
  Nothing -> error "Unable to load color data"
  Just config -> case M.lookup cref $ colors config of
    Nothing -> error $ "Color " ++ cref ++ " not found"
    Just c -> c
