path=/tmp/last_monitor_mode
lastMode=$(cat < $path)
monitorCount=$(hyprctl monitors -j | jq length)

# if only one monitor then do nothing
if [ $monitorCount -eq 1 ]; then
    exit 0
fi

reisen-monitor $lastMode
