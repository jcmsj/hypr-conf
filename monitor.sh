#!/usr/bin/env bash

# Function to change the active monitor
laptop=eDP-1
external=HDMI-A-1
activateLaptop="keyword monitor $laptop, 1920x1080@60, auto, 1"
activateHDMI="keyword monitor $external, 1920x1080@165, auto, 1"
# Note: activate a monitor before disabling the other
change_monitor() {
    mode=$1
    case $mode in
        1)
            # Logic to change to monitor 1
            hyprctl $activateLaptop
            hyprctl "keyword monitor $external, disable"
            ;;
        2)
            # Logic to change to monitor 2
            hyprctl $activateHDMI
            hyprctl "keyword monitor $laptop, disable"
            echo "Changing to monitor 2"
            ;;
        mirror)
            # Logic to enable mirror mode
            echo "Enabling mirror mode"
            hyprctl $activateLaptop
            hyprctl "keyword monitor $external, preferred,auto,1,mirror,eDP-1"
            ;;
        extend)
            # Logic to enable extend mode
            echo "Enabling extend mode"
            hyprctl $activateLaptop
            hyprctl $activateHDMI
            ;;
        *)
            echo "Invalid mode argument. Please provide one of the following: 1, 2, mirror, extend"
            ;;
    esac
}

# Check if mode argument is provided
if [ $# -eq 0 ]; then
    echo "Please provide a mode argument. Usage: $0 <mode>"
    exit 1
fi

# Call the function to change the active monitor
change_monitor $1
