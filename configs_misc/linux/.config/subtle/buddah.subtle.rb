#
# Author::  Christoph Kappel <unexist@dorfelite.net>
# Version:: $Id$
# License:: GNU GPL
#
# = Subtle default configuration
#
# This file will be installed as default and can also be used as a starter for
# an own custom configuration file. The system wide config usually resides in
# +/etc/xdg/subtle+ and the user config in +HOME/.config/subtle+, both locations
# are dependent on the locations specified by +XDG_CONFIG_DIRS+ and
# +XDG_CONFIG_HOME+.
#

#
# == Options
#
# Following options change behaviour and sizes of the window manager:
#
# Border size in pixel of the windows
set :border, 1

# Window move/resize steps in pixel per keypress
set :step, 5

# Window screen border snapping
set :snap, 10

# Default starting gravity for windows (0 = gravity of last client)
set :gravity, :center

# Make transient windows urgent
set :urgent, false

# Honor resize size hints globally
set :resize, false

# Screen strut for e.g. other panels (left, right, top, bottom)
set :strut, [ 0, 0, 0, 0 ]

# Font string either take from e.g. xfontsel or use xft
#set :font, "-*-*-profont-*-*-*-11-*-*-*-*-*-*-*"
set :font, "xft:snap-8"

# Space around windows
set :gap, 0

# Panel size padding (left, right, top, bottom)
set :padding, [ 0, 0, 0, 0 ]

# Separator between sublets
set :separator, "|"

# Outline border size in pixel of panel items
set :outline, 0

#
# == Screen
#
# Generally subtle comes with two panels per screen, one on the top and one at
# the bottom. Each panel can be configured with different panel items and
# sublets # screen wise. The default config uses top panel on the first screen
# only, it's # up to the user to enable the bottom panel or disable either one
# or both.
#
# Empty panels are hidden.
#
# Following items are available:
#
# [*:views*]     List of views with buttons
# [*:title*]     Title of the current active window
# [*:tray*]      Systray icons (Can be used once)
# [*:sublets*]   Catch-all for installed sublets
# [*:sublet*]    Name of a sublet for direct placement
# [*:spacer*]    Variable spacer (free width / count of spacers)
# [*:center*]    Enclose items with :center to center them on the panel
# [*:separator*] Insert separator
#
# === Link
#
# http://subforge.org/wiki/subtle/Panel
#

icon1 = Subtlext::Icon.new("/home/monkd/.local/share/subtle/icons/arch1.xbm")
icon2 = Subtlext::Icon.new("/home/monkd/.local/share/subtle/icons/ghost.xbm")

screen 1 do
  # Add stipple to panels
  stipple false

  # Content of the top panel
  top     [ :views, :spacer, :tasks, :layout, :clock ]

  # Content of the bottom panel
  bottom  [ :mpd, :spacer, :volume, :battery, :tray ]
end

#
# == Colors
#
# Colors directly define the look of subtle, valid values are:
#
# [*hexadecimal*] #0000ff
# [*decimal*]     (0, 0, 255)
# [*names*]       blue
#
# Whenever there is no valid value for a color set - subtle will use a default
# one. There is only one exception to this: If no background color is given no
# color will be set. This will ensure a custom background pixmap won't be
# overwritten.
#
# === Link
#
# http://subforge.org/wiki/subtle/Themes

# Colors of focus window title
color :title_fg,        "#CCCCC6"
color :title_bg,        "#262729"
color :title_border,    "#303030"

# Colors of the active views
color :focus_fg,        "#2d2815"
color :focus_bg,        "#b8a388"
color :focus_border,    "#303030"

# Colors of urgent window titles and views
color :urgent_fg,       "#353535"
color :urgent_bg,       "#d92918"
color :urgent_border,   "#303030"

# Colors of occupied views (views with clients)
color :occupied_fg,     "#b8a388"
color :occupied_bg,     "#2d2815"
color :occupied_border, "#303030"

# Color of view buttons
color :views_fg,        "#b8a388"
color :views_bg,        "#100d06"
color :views_border,    "#303030"

# Colors of sublets
color :sublets_fg,      "#917862"
color :sublets_bg,      "#100d06"
color :sublets_border,  "#303030"

# Border colors of active/inactive windows
color :client_active,   "#303030"
color :client_inactive, "#202020"

# Background colors of panels
color :panel,           "#100d06"

# Background color of root background
color :background,      "#3d3d3d"

# Color of the stipple (if enabled)
color :stipple,         "#757575"

# Color of the separator
color :separator,       "#CCCCC6"

#
# == Gravities
#
# Gravities are predefined sizes a window can be set to. There are several ways
# to set a certain gravity, most convenient is to define a gravity via a tag or
# change them during runtime via grab. Subtler and subtlext can also modify
# gravities.
#
# A gravity consists of four values which are a percentage value of the screen
# size. The first two values are x and y starting at the center of the screen
# and he last two values are the width and height.
#
# === Example
#
# Following defines a gravity for a window with 100% width and height:
#
#   gravity :example, [ 0, 0, 100, 100 ]
#
# === Link
#
# http://subforge.org/wiki/subtle/Gravity
#

  # Top left
gravity :top_left,       [   0,   0,  66,  66 ]
gravity :top_left50,     [   0,   0,  50,  66 ]

  # Top
gravity :top,            [   0,   0, 100,  66 ]

  # Top right
gravity :top_right,      [ 100,   0,  34,  66 ]
gravity :top_right33,    [ 100,   0,  34,  33 ]
gravity :top_right50,    [ 100,   0,  50,  66 ]

  # Left
gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,   0,  66, 100 ]

  # Center
gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [   0,  50, 100,  34 ]
gravity :center33,       [  50,  50,  50,  34 ]

  # Right
gravity :right,          [ 100,  49,  34,  33 ]
gravity :right33,        [ 100,  50,  34, 100 ]
gravity :right66,        [ 100,  50,  50, 100 ]

  # Bottom left
gravity :bottom_left,    [   0, 100,  50,  34 ]
gravity :bottom_left33,  [   0, 100,  33,  34 ]

  # Bottom
gravity :bottom,         [   0, 100, 100,  34 ]
gravity :bottom33,       [  49, 100,  33,  34 ]

  # Bottom right
gravity :bottom_right,   [ 100, 100,  50,  34 ]
gravity :bottom_right33, [ 100, 100,  34,  34 ]

  # Gimp
gravity :gimp_image,     [  45,  50,  70, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [ 100,   0,  20, 100 ]

  # PCManFM
gravity :pcmanfm,        [  20,  20,  40,  35 ]

#
# == Grabs
#
# Grabs are keyboard and mouse actions within subtle, every grab can be
# assigned either to a key and/or to a mouse button combination. A grab
# consists of a chain and an action.
#
# === Finding keys
#
# The best resource for getting the correct key names is
# */usr/include/X11/keysymdef.h*, but to make life easier here are some hints
# about it:
#
# * Numbers and letters keep their names, so *a* is *a* and *0* is *0*
# * Keypad keys need *KP_* as prefix, so *KP_1* is *1* on the keypad
# * Strip the *XK_* from the key names if looked up in
#   /usr/include/X11/keysymdef.h
# * Keys usually have meaningful english names
# * Modifier keys have special meaning (Alt (A), Control (C), Meta (M),
#   Shift (S), Super (W))
#
# === Chaining
#
# Chains are a combination of keys and modifiers to one key and can be used in
# various ways to trigger an action. In subtle there are two ways to define
# chains for grabs:
#
#   1. Default way*: Add modifiers to a key and use it for a grab
#
#      *Example*: grab "W-Return", "urxvt"
#
#   2. *Escape way*: Define an escape grab that needs to be pressed before
#      *any* other grab can be used like in screen/tmux.
#
#      *Example*: grab "C-y", :SubtleEscape
#                 grab "Return", "urxvt"
#
# ==== Mouse buttons
#
# [*B1*] = Button1 (Left mouse button)
# [*B2*] = Button2 (Middle mouse button)
# [*B3*] = Button3 (Right mouse button)
# [*B4*] = Button4 (Mouse wheel up)
# [*B5*] = Button5 (Mouse wheel down)
#
# ==== Modifiers
#
# [*A*] = Alt key
# [*C*] = Control key
# [*M*] = Meta key
# [*S*] = Shift key
# [*W*] = Super (Windows) key
#
# === Action
#
# An action is something that happens when a grab is activated, this can be one
# of the following:
#
# [*symbol*] Run a subtle action
# [*string*] Start a certain program
# [*array*]  Cycle through gravities
# [*lambda*] Run a Ruby proc
#
# === Example
#
# This will create a grab that starts a urxvt when Alt+Enter are pressed:
#
#   grab "A-Return", "urxvt"
#
# === Link
#
# http://subforge.org/wiki/subtle/Grabs
#

# Escape grab
#  grab "C-y", :SubtleEscape

# Jump to view1, view2, ...
grab "W-S-1", :ViewJump1
grab "W-S-2", :ViewJump2
grab "W-S-3", :ViewJump3
grab "W-S-4", :ViewJump4

# Switch current view
grab "W-1", :ViewSwitch1
grab "W-2", :ViewSwitch2
grab "W-3", :ViewSwitch3
grab "W-4", :ViewSwitch4

# Select next and prev view */
grab "KP_Add",      :ViewNext
grab "KP_Subtract", :ViewPrev

# Move mouse to screen1, screen2, ...
grab "W-A-1", :ScreenJump1
grab "W-A-2", :ScreenJump2
grab "W-A-3", :ScreenJump3
grab "W-A-4", :ScreenJump4

# Force reload of config and sublets
grab "W-C-r", :SubtleReload

# Force restart of subtle
grab "W-C-S-r", :SubtleRestart

# Quit subtle
grab "W-C-q", :SubtleQuit

# Move current window
grab "W-B1", :WindowMove

# Resize current window
grab "W-B3", :WindowResize

# Toggle floating mode of window
grab "W-f", :WindowFloat

# Toggle fullscreen mode of window
grab "W-space", :WindowFull

# Toggle sticky mode of window (will be visible on all views)
grab "W-s", :WindowStick

# Raise window
grab "W-S-r", :WindowRaise

# Lower window
grab "W-S-l", :WindowLower

# Select next windows
grab "W-Left",  :WindowLeft
grab "W-Down",  :WindowDown
grab "W-Up",    :WindowUp
grab "W-Right", :WindowRight

# Kill current window
grab "W-k", :WindowKill

# Cycle between given gravities
#grab "W-KP_7", [ :top_left,     :top_left66,     :top_left33     ]
#grab "W-KP_8", [ :top,          :top66,          :top33          ]
#grab "W-KP_9", [ :top_right,    :top_right66,    :top_right33    ]
#grab "W-KP_4", [ :left,         :left66,         :left33         ]
#grab "W-KP_5", [ :center,       :center66,       :center33       ]
#grab "W-KP_6", [ :right,        :right66,        :right33        ]
#grab "W-KP_1", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
#grab "W-KP_2", [ :bottom,       :bottom66,       :bottom33       ]
#grab "W-KP_3", [ :bottom_right, :bottom_right66, :bottom_right33 ]

# In case no numpad is available e.g. on notebooks
grab "W-q", [ :top_left,     :top_left66,     :top_left33     ]
grab "W-w", [ :top,          :top66,          :top33          ]
grab "W-e", [ :top_right,    :top_right66,    :top_right33    ]
grab "W-a", [ :left,         :left66,         :left33         ]
grab "W-s", [ :center,       :center66,       :center33       ]
grab "W-d", [ :right,        :right66,        :right33        ]
grab "W-z", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
grab "W-x", [ :bottom,       :bottom66,       :bottom33       ]
grab "W-c", [ :bottom_right, :bottom_right66, :bottom_right33 ]

# Exec programs
grab "W-Return", "urxvt"

grab "W-C-c", "xterm -e irssi"

# Launcher
begin
  require "#{ENV["HOME"]}/.config/subtle/subtle-contrib/ruby/launcher.rb" 

  # Set fonts
  Subtle::Contrib::Launcher.fonts = [
    "xft:snap:pixelsize=24:antialias=true",
    "xft:snap:pixelsize=10:antialias=true" 
  ]
rescue LoadError => error
  puts error
end

grab "W-r" do
  Subtle::Contrib::Launcher.run
end

# Run Ruby lambdas
grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end

#
# == Tags
#
# Tags are generally used in subtle for placement of windows. This placement is
# strict, that means that - aside from other tiling window managers - windows
# must have a matching tag to be on a certain view. This also includes that
# windows that are started on a certain view will not automatically be placed
# there.
#
# There are to ways to define a tag:
#
# === Simple
#
# The simple way just needs a name and a regular expression to just handle the
# placement:
#
# Example:
#
#  tag "terms", "terms"
#
# === Extended
#
# Additionally tags can do a lot more then just control the placement - they
# also have properties than can define and control some aspects of a window
# like the default gravity or the default screen per view.
#
# Example:
#
#  tag "terms" do
#    match   "xterm|[u]?rxvt"
#    gravity :center
#  end
#
# === Default
#
# Whenever a window has no tag it will get the default tag and be placed on the
# default view. The default view can either be set by the user with adding the
# default tag to a view by choice or otherwise the first defined view will be
# chosen automatically.
#
# === Properties
#
# [*float*]     This property either sets the tagged client floating or prevents
#               it from being floating depending on the value.
#
#               Example: float true
#
# [*full*]      This property either sets the tagged client to fullscreen or
#               prevents it from being set to fullscreen depending on the value.
#
#               Example: full true
#
# [*geometry*]  This property sets a certain geometry as well as floating mode
#               to the tagged client, but only on views that have this tag too.
#               It expects an array with x, y, width and height values whereas
#               width and height must be >0.
#
#               Example: geometry [100, 100, 50, 50]
#
# [*gravity*]   This property sets a certain to gravity to the tagged client,
#               but only on views that have this tag too.
#
#              Example: gravity :center
#
# [*match*]    This property adds matching patterns to a tag, a tag can have
#              more than one. Matching works either via plaintext, regex
#              (see man regex(7)) or window id. Per default tags will only
#              match the WM_NAME and the WM_CLASS portion of a client, this
#              can be changed with following possible values:
#
#              [*:name*]      Match the WM_NAME
#              [*:instance*]  Match the first (instance) part from WM_CLASS
#              [*:class*]     Match the second (class) part from WM_CLASS
#              [*:role*]      Match the window role
#
#              Example: match :instance => "urxvt"
#                       match [:role, :class] => "test"
#                       match "[xa]+term"
#
# [*exclude*]  This property works exactly the same way as *match*, but it
#              excludes clients that match from this tag. That can be helpful
#              with catch-all tags e.g. for console apps.
#
#              Example: exclude :instance => "irssi"
#
# [*resize*]   This property either enables or disables honoring of client
#              resize hints and is independent of the global option.
#
#              Example: resize true
#
# [*stick*]    This property either sets the tagged client to stick or prevents
#              it from being set to stick depending on the value. Stick clients
#              are visible on every view.
#
#              Example: stick true
#
# [*type*]     This property sets the [[Tagging|tagged]] client to be treated
#              as a specific window type though as the window sets the type
#              itself. Following types are possible:
#
#              [*:desktop*]  Treat as desktop window (_NET_WM_WINDOW_TYPE_DESKTOP)
#              [*:dock*]     Treat as dock window (_NET_WM_WINDOW_TYPE_DOCK)
#              [*:toolbar*]  Treat as toolbar windows (_NET_WM_WINDOW_TYPE_TOOLBAR)
#              [*:splash*]   Treat as splash window (_NET_WM_WINDOW_TYPE_SPLASH)
#              [*:dialog*]   Treat as dialog window (_NET_WM_WINDOW_TYPE_DIALOG)
#
#              Example: type :desktop
#
# [*urgent*]   This property either sets the tagged client to be urgent or
#              prevents it from being urgent depending on the value. Urgent
#              clients will get keyboard and mouse focus automatically.
#
#              Example: urgent true
#
# === Link
#
# http://subforge.org/wiki/subtle/Tagging
#


# Simple tags
tag "terms"do
	match	"[u]?rxvt"
	gravity	:top
end

tag "browser", "navigator|opera|firefox|luakit"
tag "files",	"pcmanfm-mod|ranger"
tag "media",	"mplayer|ncmpcpp"
tag "chat",	"xterm"

# Placement
tag "editor" do
  match  "medit"
  resize true
end

tag "fixed" do
  geometry [ 10, 10, 100, 100 ]
  stick    true
end

tag "resize" do
  match  "sakura|medit"
  resize true
end

tag "gravity" do
  gravity :left
end

# Modes
tag "stick" do
  match "mplayer"
  float true
  stick true
end

tag "float" do
  match "display"
  float true
end

# Gimp
tag "gimp_image" do
  match   :role => "gimp-image-window"
  gravity :gimp_image
end

tag "gimp_toolbox" do
  match   :role => "gimp-toolbox$"
  gravity :gimp_toolbox
end

tag "gimp_dock" do
  match   :role => "gimp-dock"
  gravity :gimp_dock
end

# PCManFM
tag "filemanager" do
  match "pcmanfm"
  gravity :pcmanfm
end

#
# == Views
#
# Views are the virtual desktops in subtle, they show all windows that share a
# tag with them. Windows that have no tag will be visible on the default view
# which is the view with the default tag or the first defined view when this
# tag isn't set.
#
# Like tags views can be defined in two ways:
#
# === Simple
#
# The simple way is exactly the same as for tags:
#
# Example:
#
#   view "terms", "terms"
#
# === Extended
#
# The extended way for views is also similar to the tags, but with fewer
# properties.
#
# Example:
#
#  view "terms" do
#    match "terms"
#    icon  "/usr/share/icons/icon.xbm"
#  end
#
# === Properties
#
# [*match*]      This property adds a matching pattern to a view. Matching
#                works either via plaintext or regex (see man regex(7)) and
#                applies to names of tags.
#
#                Example: match "terms"
#
# [*dynamic*]    This property hides unoccupied views, views that display no
#                windows.
#
#                Example: dynamic true
#
# [*icon*]       This property adds an icon in front of the view name. The
#                icon can either be path to an icon or an instance of
#                Subtlext::Icon.
#
#                Example: icon "/usr/share/icons/icon.xbm"
#                         icon Subtlext::Icon.new("/usr/share/icons/icon.xbm")
#
# [*icon_only*]  This property hides the view name from the view buttons, just
#                the icon will be visible.
#
#                Example: icon_only true
#
#
# === Link
#
# http://subforge.org/wiki/subtle/Tagging
#

iconpath = "#{ENV["HOME"]}/.local/share/subtle/icons"

view "term" do
	match	"terms"
	icon	"#{iconpath}/terminal.xbm"
end
	
view "www" do
	match	"browser"
	icon	"#{iconpath}/world.xbm"
end

view "files" do
	match	"files"
	icon	"#{iconpath}/shelf.xbm"
end

view "media" do
	match	"media"
	icon	"#{iconpath}/movie.xbm"
end

view "edit" do
	match	"editor"
	icon	"#{iconpath}/pencil.xbm"
end

view "chat" do
	match	"chat"
	icon	"#{iconpath}/mail.xbm"
end

#
# == Sublets
#
# Sublets are Ruby scripts that provide data for the panel and can be managed
# with the sur script that comes with subtle.
#
# === Example
#
#  sur install clock
#  sur uninstall clock
#  sur list
#
# === Configuration
#
# All sublets have a set of configuration values that can be changed directly
# from the config of subtle.
#
# There are three default properties, that can be be changed for every sublet:
#
# [*interval*]    Update interval of the sublet
# [*foreground*]  Default foreground color
# [*background*]  Default background color
#
# sur can also give a brief overview about properties:
#
# === Example
#
#   sur config clock
#
# The syntax of the sublet configuration is similar to other configuration
# options in subtle:
#
# === Example
#
sublet :clock do
  interval      30
  foreground    "#d8c1b1"
  background    "#151515"
  format_string "%H:%M"
end
#
#  === Link
#
# http://subforge.org/wiki/subtle/Sublets
#

#
# == Hooks
#
# And finally hooks are a way to bind Ruby scripts to a certain event.
#
# Following hooks exist so far:
#
# [*:client_create*]    Called whenever a window is created
# [*:client_configure*] Called whenever a window is configured
# [*:client_focus*]     Called whenever a window gets focus
# [*:client_kill*]      Called whenever a window is killed
#
# [*:tag_create*]       Called whenever a tag is created
# [*:tag_kill*]         Called whenever a tag is killed
#
# [*:view_create*]      Called whenever a view is created
# [*:view_configure*]   Called whenever a view is configured
# [*:view_jump*]        Called whenever the view is switched
# [*:view_kill*]        Called whenever a view is killed
#
# [*:tile*]             Called on whenever tiling would be needed
# [*:reload*]           Called on reload
# [*:start*]            Called on start
# [*:exit*]             Called on exit
#
# === Example
#
# This hook will print the name of the window that gets the focus:
#
#   on :client_focus do |c|
#     puts c.name
#   end
#
# === Link
#
# http://subforge.org/wiki/subtle/Hooks
#

# vim:ts=2:bs=2:sw=2:et:fdm=marker
