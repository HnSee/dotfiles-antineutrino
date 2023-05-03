if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  WLR_DRM_DEVICES=/dev/dri/card1:/dev/dri/card0 exec Hyprland
fi
