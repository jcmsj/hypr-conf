#!/usr/bin/env bash
# numbers represent the non-parallel orders too
#1 lockscreen and wallpaper
hyprlock & 
hyprpaper &
#2 eww
eww daemon &
eww open bar &
eww open barx & 
nm-applet --indicator &

#3
~/.config/eww/scripts/update-brightness &
~/.config/eww/scripts/update-vol &
~/.config/eww/scripts/bt/update &

#4 clipboards
wl-paste --type text --watch cliphist store & #Stores only text
wl-paste --type image --watch cliphist store & #Stores only image data

#5
hypridle ## dont run hypridle concurrently
