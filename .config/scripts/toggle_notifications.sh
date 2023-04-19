#!/bin/sh

if [ "$(dunstctl is-paused)" = "true" ]; then
  dunstctl set-paused false
  dunstify -a Notifications enabled
else
  dunstctl set-paused true
fi
