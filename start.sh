#!/usr/bin/env bash
eww daemon
eww open bar
hyprpaper &
wl-paste --type text --watch cliphist store & #Stores only text
wl-paste --type image --watch cliphist store & #Stores only image data
#waybar &
nm-applet --indicator &
mako
