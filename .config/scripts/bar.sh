#!/bin/sh
if hyprctl monitors -j | jq -e '[.[].name | contains("HDMI")] | any' > /dev/null; then
	waybar $@
else
	waybar -c ~/.config/waybar/config_mobile $@
fi
