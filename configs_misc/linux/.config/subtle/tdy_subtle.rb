#
# Author::  Christoph Kappel <unexist@dorfelite.net>
# Version:: $Id: contrib/subtle.rb,v 2264 2010/11/08 23:03:50 unexist $
# License:: GNU GPL
#
# = Subtle example configuration
#
# This file will be installed as default and can also be used as a starter for
# an own custom configuration file. The system wide config usually resides in
# +/etc/xdg/subtle+ and the user config in +HOME/.config/subtle+, both locations
# are dependent on the locations specified by +XDG_CONFIG_DIRS+ and
# +XDG_CONFIG_HOME+.
#

# == Options {{{
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

# Enable respecting of size hints globally
set :resize, false

# Screen size padding (left, right, top, bottom)
set :padding, [ 0, 0, 1, 0 ]

# Font string either take from e.g. xfontsel or use xft
set :font, "-*-clean-medium-*-*-*-12-*-*-*-*-*-*-*"
#set :font, "xft:sans-8"

# Space around windows
set :gap, 0

# Separator between sublets
set :separator, "               "

# Outline border size in pixel of panel items
set :outline, 0
# == Options }}}

# == Screen {{{
#
# Generally subtle comes with two panels per screen, one on the top and one at
# the bottom. Each panel can be configured with different panel items and sublets
# screen wise. Per default only the top panel on the first screen is used, it's
# up to the user to enable the bottom panel or disable either one or both.
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

screen 1 do
  # Add stipple to panels
  stipple false

  # Content of the top panel
  top     [ :views, :tasks, :spacer, :mpd, :tray, :pacman, :temp, :volume ]

  # Content of the bottom panel
  bottom  [ :freq, :cpuchart, :separator,
            :mem, :separator,
            :fs, :separator,
            :netdown, :separator,
            :netup, :spacer,
            :weather, :clock
  ]
end
# == Screen }}}

# == Colors {{{
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
#

# Colors of focus window title
color :title_fg,         "#000000"
color :title_bg,         "#908884"
color :title_border,     "#908884"

# Colors of the active views
color :focus_fg,         "#000000"
color :focus_bg,         "#908884"
color :focus_border,     "#908884"

# Colors of urgent window titles and views
color :urgent_fg,        "#c6c6c6"
color :urgent_bg,        "#cd7171"
color :urgent_border,    "#303030"

# Colors of occupied views (views with clients)
color :occupied_fg,      "#c6c6c6"
color :occupied_bg,      "#22211f"
color :occupied_border,  "#303030"

# Color of view buttons
color :views_fg,         "#757575"
color :views_bg,         "#22211f"
color :views_border,     "#303030"

# Colors of sublets
color :sublets_fg,       "#908884"
color :sublets_bg,       "#202020"
color :sublets_border,   "#303030"

# Colors of panel
color :stipple,          "#908884"
color :panel,            "#22211f"

# Border colors of active/inactive windows
color :client_active,   "#303030"
color :client_inactive, "#202020"

# Background color of root background
color :background,      "#282828"

# Color of the stipple (if enabled)
color :stipple,         "#202020"

# Color of the separator
color :separator,       "#757575"
# == Colors }}}

# == Gravities {{{
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
gravity :top_left,       [   0,   0,  59,  50 ]
gravity :top_left66,     [   0,   0,  59,  66 ]
gravity :top_left33,     [   0,   0,  59,  34 ]

  # Top
gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]

  # Top right
gravity :top_right,      [ 100,   0,  41,  50 ]
gravity :top_right66,    [ 100,   0,  41,  66 ]
gravity :top_right33,    [ 100,   0,  41,  34 ]

  # Left
gravity :left,           [   0,   0,  59, 100 ]
gravity :left66,         [   0,  50,  59,  34 ]
gravity :left33,         [   0,  50,  30,  34 ]

  # Center
gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [   0,  50, 100,  34 ]
gravity :center33,       [  50,  50,  50,  34 ]

  # Right
gravity :right,          [ 100,   0,  41, 100 ]
gravity :right66,        [ 100,  50,  41,  34 ]
gravity :right33,        [ 100,  50,  20,  34 ]

  # Bottom left
gravity :bottom_left,    [   0, 100,  59,  50 ]
gravity :bottom_left66,  [   0, 100,  59,  66 ]
gravity :bottom_left33,  [   0, 100,  59,  34 ]

  # Bottom
gravity :bottom,         [   0, 100, 100,  50 ]
gravity :bottom66,       [   0, 100, 100,  66 ]
gravity :bottom33,       [   0, 100, 100,  34 ]

  # Bottom right
gravity :bottom_right,   [ 100, 100,  41,  50 ]
gravity :bottom_right66, [ 100, 100,  41,  66 ]
gravity :bottom_right33, [ 100, 100,  41,  34 ]

  # Gimp
gravity :gimp_image,     [  50,  50,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [ 100,   0,  10, 100 ]
# == Gravities }}}

# == Grabs {{{
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
grab "W-S-q", :SubtleQuit

# Move current window
grab "W-B1", :WindowMove

# Resize current window
grab "W-B3", :WindowResize

# Toggle floating mode of window
grab "W-f", :WindowFloat

# Toggle fullscreen mode of window
grab "W-space", :WindowFull

# Toggle sticky mode of window (will be visible on all views)
grab "W-v", :WindowStick

# Raise window
grab "W-r", :WindowRaise

# Lower window
grab "W-l", :WindowLower

# Select next windows
grab "W-Left",  :WindowLeft
grab "W-Down",  :WindowDown
grab "W-Up",    :WindowUp
grab "W-Right", :WindowRight
grab "A-S-Tab", :WindowLeft
grab "A-Tab",   :WindowRight
grab "W-S-Tab", :WindowUp
grab "W-Tab",   :WindowDown

# Kill current window
grab "A-F4", :WindowKill

# Cycle between given gravities
grab "W-KP_7", [ :top_left,     :top_left66,     :top_left33     ]
grab "W-KP_8", [ :top,          :top66,          :top33          ]
grab "W-KP_9", [ :top_right,    :top_right66,    :top_right33    ]
grab "W-KP_4", [ :left,         :left66,         :left33         ]
grab "W-KP_5", [ :center,       :center66,       :center33       ]
grab "W-KP_6", [ :right,        :right66,        :right33        ]
grab "W-KP_1", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
grab "W-KP_2", [ :bottom,       :bottom66,       :bottom33       ]
grab "W-KP_3", [ :bottom_right, :bottom_right66, :bottom_right33 ]
grab "W-q",    [ :top_left,     :top_left66,     :top_left33     ]
grab "W-w",    [ :top,          :top66,          :top33          ]
grab "W-e",    [ :top_right,    :top_right66,    :top_right33    ]
grab "W-a",    [ :left,         :left66,         :left33         ]
grab "W-s",    [ :center,       :center66,       :center33       ]
grab "W-d",    [ :right,        :right66,        :right33        ]
grab "W-z",    [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
grab "W-x",    [ :bottom,       :bottom66,       :bottom33       ]
grab "W-c",    [ :bottom_right, :bottom_right66, :bottom_right33 ]

# Exec programs
grab "A-F2", 'dmenu_run -nb "#908884" -nf "#000" -sb "#22211f" -sf "#908884" -p "Launch:" -i'
grab "W-Return", "urxvtc"

# Run Ruby lambdas
grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end
# == Grabs }}}

# == Tags {{{
#
# Tags are generally used in subtle for placement of windows. This placement is
# strict, that means that - aside from other tiling window managers - windows
# must have a matching tag to be on a certain view. This also includes that
# windows that are started on a certain view will not automatically be placed
# there.
#
# There are to ways to define a tag:
#
# [*string*]  With a WM_CLASS/WM_NAME
# [*hash*]    With a hash of properties
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
# Additionally tags can do a lot more then just control the placement - they
# also have properties than can define and control some aspects of a window
# like the default gravity or the default screen per view.
#
# [*float*]   This property either sets the tagged client floating or prevents
#              it from being floating depending on the value.
#
#              Example: float true
#
# [*full*]    This property either sets the tagged client to fullscreen or
#              prevents it from being set to fullscreen depending on the value.
#
#              Example: full true
#
# [*gravity*] This property sets a certain to gravity to the tagged client,
#              but only on views that have this tag too.
#
#              Example: gravity :center
#
# [*match*]   This property adds matching patterns to a tag, a tag can have
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
# [*exclude*] This property works exactly the same way as *match*, but it
#              excludes clients that match from this tag. That can be helpful
#              with catch-all tags e.g. for console apps.
#
#              Example: exclude :instance => "irssi"
#
# [*resize*]  This property either enables or disables honoring of client
#              resize hints and is independent of the global option.
#
#              Example: resize true
#
# [*size*]    This property sets a certain to size as well as floating to the
#              tagged client, but only on views that have this tag too. It
#              expects an array with x, y, width and height values.
#
#              Example: size [100, 100, 50, 50]
#
# [*stick*]   This property either sets the tagged client to stick or prevents
#              it from being set to stick depending on the value. Stick clients
#              are visible on every view.
#
#              Example: stick true
#
# [*type*]    This property sets the [[Tagging|tagged]] client to be treated
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
# [*urgent*]  This property either sets the tagged client to be urgent or
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
tag "terms",   "xterm|[u]?rxvt[c]?"
tag "browser", "chromium|firefox|navigator"
tag "office"

# Placement
tag "office" do
  match  "[g]?vim"
  resize true
end

tag "office" do
  match "VirtualBox"
  float true
  resize true
end

tag "fixed" do
  geometry [ 10, 10, 100, 100 ]
  stick    true
end

tag "resize" do
  match  "sakura|gvim"
  resize true
end

tag "gravity" do
  gravity :center
end

# Modes
tag "stick" do
  match "mplayer"
  float true
#  stick true
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
# == Tags }}}

# == Views {{{
#
# Views are the virtual desktops in subtle, they show all windows that share a
# tag with them. Windows that have no tag will be visible on the default view
# which is the view with the default tag or the first defined view when this
# tag isn't set.
#
# === Link
#
# http://subforge.org/wiki/subtle/Tagging
#

view " 01 ", "terms|default"
view " 02 ", "browser"
view " 03 ", "gimp_.*"
view " 04 ", "office"
# == Views }}}

# == Sublets {{{
#
# Sublets are Ruby scripts that provide data for the panel and can be managed
# with the sur script that comes with subtle.
#
# Follwing properties can be changed directly:
#
# [*interval*]    Update interval of the sublet
# [*foreground*]  Default foreground color
# [*background*]  Default background color
#
# === Example
#
#  sublet :clock do
#    interval      30
#    foreground    "#eeeeee"
#    background    "#000000"
#    format_string "%H:%M:%S"
#  end
#
#  === Link
#
# http://subforge.org/wiki/subtle/Sublets#Configuration
#

sublet :clock do
  interval 60
  format_date "%a %m/%d"
  format_time "@ %I:%M %p"
end

sublet :mem do
  interval 5
  width 50
  height 8
end

sublet :netdown do
  interval 2
  device "eth0"
end

sublet :netup do
  interval 2
  device "eth0"
end

sublet :weather do
  interval 1800
  station "KOUN"
end
# == Sublets }}}

# == Hooks {{{
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
# == Hooks }}}

# == Snippets {{{
#

### # Current-view
### on :start do
###   # Create missing tags
###   views = Subtlext::View.all.map {|v| v.name }
###   tags  = Subtlext::Tag.all.map {|t| t.name }
###
###   views.each do |v|
###     unless(tags.include?(v))
###       t = Subtlext::Tag.new(v)
###       t.save
###     end
###   end
### end
###
### # Assign tags to clients
### on :client_create do |c|
###   view = Subtlext::View.current
###   tags = c.tags.map {|t| t.name }
###
###   # Add tag to view
###   view.tag(view.name) unless(view.tags.include?(view.name))
###
###   # Exclusive for clients with default tag only
###   if(tags.include?("default") and 1 == tags.size)
###     c.tags = [ view.name ]
###   end
### end

on :start do
  Subtlext::Subtle.spawn "nitrogen --restore"
  Subtlext::Subtle.spawn "xsetroot -cursor_name left_ptr"
end

begin
  require "#{ENV["HOME"]}/bin/launcher/launcher.rb"

  # Set fonts
  Subtle::Contrib::Launcher.fonts = [
    "xft:Envy Code R:pixelsize=80:antialias=true",
    "xft:Envy Code R:pixelsize=12:antialias=true"
  ]
rescue LoadError => err
  p err
end
grab "W-grave" do
  Subtle::Contrib::Launcher.run
end
# == Snippets }}}

# vim:ts=2:bs=2:sw=2:et:fdm=marker
