#!/bin/sh
PRIMARY="#ffb454"
ACCENT="#59c2ff"
ERROR="#f07171"

swaylock \
  --screenshots \
  --clock \
  --indicator \
  --indicator-radius 200 \
  --indicator-thickness 20 \
  --font "Inter" \
  --timestr "%H:%M" \
  --datestr "%d.%m.%Y" \
  --fade-in "0.2" \
  --effect-blur "6x6" \
  --color "00000000" \
  --bs-hl-color "$ACCENT" \
  --key-hl-color "$PRIMARY" \
  --inside-color "#1e1e2e" \
  --inside-clear-color "#1e1e2e" \
  --inside-ver-color "#1e1e2e" \
  --inside-wrong-color "#1e1e2e" \
  --line-color "#11111b" \
  --line-ver-color "#11111b" \
  --line-clear-color "#11111b" \
  --line-wrong-color "#11111b" \
  --ring-color "#181825" \
  --ring-clear-color "$PRIMARY" \
  --ring-ver-color "$PRIMARY" \
  --ring-wrong-color "$ERROR" \
  --separator-color "00000000" \
  --text-color "#ffffff" \
  --text-clear-color "#ffffff" \
  --text-ver-color "#ffffff" \
  --text-wrong-color "$ERROR"
