#!/usr/bin/env bash
# numbers represent the non-parallel orders too
#1 lockscreen and wallpaper
hyprlock & 
hyprpaper &
#2 auto starts the gnome's auth agent 
$gnomeAuthAgent &
#3 ags
ags
nm-applet --indicator &

#4 clipboards
wl-paste --type text --watch cliphist store & #Stores only text
wl-paste --type image --watch cliphist store & #Stores only image data

#5
hypridle ## dont run hypridle concurrently
