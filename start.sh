#!/usr/bin/env bash

hyprpaper &
wl-paste --type text --watch cliphist store & #Stores only text
wl-paste --type image --watch cliphist store & #Stores only image data
waybar &
nm-applet --indicator &
mako
