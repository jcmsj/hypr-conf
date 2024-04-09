#!/usr/bin/env bash

# Function to change the active monitor
laptop=eDP-1
external=HDMI-A-1
# Note: activate a monitor before disabling the other

monitor() {
    name=$1
    state=$2
    hyprctl "keyword monitor $name, $state"
}
highrr() {
    name=$1
    hyprctl "keyword monitor $name, highrr, auto 1"
}
mirror() {
    monitor=$1
    mirroredDisplay=$2
    hyprctl "keyword monitor $monitor,preferred,auto,1,mirror,$mirroredDisplay"
}
change_monitor() {
    mode=$1
    case $mode in
        1)
            # Logic to change to monitor 1
            monitor $laptop enable
            monitor $external disable
            echo "Changing to monitor 1"
            ;;
        2)
            # Logic to change to monitor 2
            highrr $external
            monitor $laptop disable
            echo "Changing to monitor 2"
            ;;
        mirror)
            # Logic to enable mirror mode
            monitor $laptop enable
            mirror $external $laptop
            echo "Enabling mirror mode"
            ;;
        extend)
            # Logic to enable extend mode
            monitor $laptop enable
            highrr $external
            echo "Enabling extend mode"
            ;;
        *)
            echo "Invalid mode argument `$mode`. Please provide a <mode>: 1, 2, mirror, extend"
            return 1
            ;;
    esac
    echo $mode > /tmp/last_monitor_mode
}

# Call the function to change the active monitor
change_monitor $1
