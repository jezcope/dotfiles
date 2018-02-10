import XMonad
import Control.Monad
import Data.Monoid
import System.Exit
import Data.Function ((&))
 
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Config.Mate
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Tabbed
import XMonad.Layout.LayoutHints
import XMonad.Layout.Spacing
import XMonad.Layout.Spiral
import XMonad.Layout.NoBorders
import XMonad.Actions.CycleWS

import Colors

myTerminal      = "sakura"
 
myFocusFollowsMouse = True
 
myBorderWidth   = 2
myWindowSpacing = 10
 
myModMask       = mod4Mask
 
myWorkspaces    = map show [1..8]
-- A tagging example:
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
 
myNormalBorderColor  = walColor "color0"
myFocusedBorderColor = walColor "color4"

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_r     ), spawn "rofi -show drun")
    , ((modm .|. shiftMask, xK_r     ), spawn "gmrun")
 
    , ((modm .|. shiftMask, xK_c     ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    , ((modm,               xK_l     ), spawn "mate-screensaver-command -l")
 
    , ((modm .|. shiftMask, xK_Tab   ), spawn "rofi -show window")
    , ((modm,               xK_t     ), windows W.focusDown)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_n     ), windows W.focusUp  )
    , ((modm,               xK_m     ), windows W.focusMaster  )
 
    , ((modm,               xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
 
    , ((modm .|. shiftMask, xK_h     ), sendMessage Shrink)
    , ((modm .|. shiftMask, xK_l     ), sendMessage Expand)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
 
    -- Push window back into tiling
    , ((modm .|. shiftMask, xK_t     ), withFocused $ windows . W.sink)
 
 
    -- Toggle the status bar gap
    , ((modm              , xK_b     ), sendMessage ToggleStruts)
 
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
 
    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    -- Lock the screen
    -- , ((modm .|. shiftMask, xK_z     ), spawn "xscreensaver-command -lock")

    -- Next/previous WS
    , ((modm              , xK_Right ), nextWS)
    , ((modm              , xK_Left  ), prevWS)
    , ((modm              , xK_o     ), nextScreen)
    , ((modm .|. shiftMask, xK_o     ), shiftNextScreen)
    ]
    ++
 
    --
    -- mod-[1..9], Switch to workspace N
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_8]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
 
    --
    -- Arrange screens {*9*,0} where *9* is the primary display
    -- mod-{9,0}, Switch to physical/Xinerama screens
    -- mod-shift-{9,0}, Move client to screen
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_9, xK_0] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
 
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
 
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
 
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
 
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    , ((modm, button4), (\w -> nextWS))
    , ((modm, button5), (\w -> prevWS))
    ]

------------------------------------------------------------------------
-- Layouts:
myLayout =
    ((avoidStruts (sp ||| spccw ||| tiled ||| hTiled ||| simpleTabbed ||| Full)
     & spacingWithEdge myWindowSpacing)
    ||| noBorders Full)
    & layoutHints
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio
    hTiled = Mirror tiled
    sp = spiral (16/9)
    spccw = spiralWithDir South CCW ratio
 
    -- The default number of windows in the master pane
    nmaster = 1
 
    -- Default proportion of screen occupied by master pane
    ratio   = 3/5
 
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

------------------------------------------------------------------------
-- Window rules:
 
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
-- myManageHook = isDialog --> doF W.shiftMaster <+> doF W.swapDown
-- myManageHook = fmap not isDialog --> doF avoidMaster
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "Sonata"         --> doFloat
    , className =? "Skype"          --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    , resource  =? "Do"             --> doIgnore
    , className =? "Pidgin"         --> doFloat
    , fmap not isDialog             --> doF avoidMaster]
  where
    avoidMaster :: W.StackSet i l a s sd -> W.StackSet i l a s sd
    avoidMaster = W.modify' $ \c -> case c of
        W.Stack t [] (r:rs) ->  W.Stack t [r] rs
        otherwise           -> c

------------------------------------------------------------------------
-- Event handling
 
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add EWMH event handling to your custom event hooks by
-- combining them with ewmhDesktopsEventHook.
--
myEventHook = docksEventHook

-- Hacky focus fix from http://mth.io/posts/xmonad-java-focus/
local_atom_WM_TAKE_FOCUS :: X Atom
local_atom_WM_TAKE_FOCUS = getAtom "WM_TAKE_FOCUS"

takeFocusX :: Window -> X ()
takeFocusX w =
  withWindowSet . const $ do
    dpy <- asks display
    wmtakef <- local_atom_WM_TAKE_FOCUS
    wmprot <- atom_WM_PROTOCOLS
    protocols <- io $ getWMProtocols dpy w
    when (wmtakef `elem` protocols) $
      io . allocaXEvent $ \ev -> do
          setEventType ev clientMessage
          setClientMessageEvent ev w wmprot 32 wmtakef currentTime
          sendEvent dpy w False noEventMask ev

takeTopFocus :: X ()
takeTopFocus =
  withWindowSet $ maybe (setFocusX =<< asks theRoot) takeFocusX . W.peek
 
------------------------------------------------------------------------
-- Status bars and logging
myLogHook = takeTopFocus >> setWMName "LG3D"
 
------------------------------------------------------------------------
-- Startup hook
myStartupHook = docksStartupHook

-- Run xmonad with the settings you specify. No need to modify this.
--
main = ewmh defaults
       & xmonad
 
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = mateConfig {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
 
      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
 
      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook <+> manageDocks,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }
