#!/bin/bash

dir="$HOME/.config/wofi"
wofi_command="wofi --conf $dir/config_audiooutput"

device_names="$(pactl list sinks | grep -oP "Description: \K.*")"
device_ids="$(pactl list sinks | grep -oP "Name: \K.*")"
devices_raw="$(pactl list sinks | grep -oP "(Name: \K.*|Description: \K.*)" | paste -d ";" - -)"

declare -A devices
while IFS=";" read -r id name; do
  devices["$name"]="$id"
done <<< "$devices_raw"

options="$(IFS=$'\n'; echo "${!devices[*]}")"
chosen="$(echo -e "$options" | $wofi_command --dmenu)"

pactl set-default-sink "${devices[$chosen]}"
notify-send -a "Audio" "New output chosen" "$chosen"
