#!/bin/bash

dir="$HOME/.config/wofi"
wofi_command="wofi --conf $dir/config_powermenu"

# Options
shutdown="   Shut down"
reboot="   Reboot"
suspend="⏾   Suspend"

options="$shutdown\n$reboot\n$suspend"

chosen="$(echo -e "$options" | $wofi_command --dmenu)"
case $chosen in
    $shutdown)
	    poweroff
        ;;
    $reboot)
	    reboot
        ;;
    $suspend)
	    systemctl suspend
        ;;
esac
