if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then

  # NVIDIA as main GPU (proprietary driver):
  # WLR_RENDERER_ALLOW_SOFTWARE=1
  # WLR_DRM_DEVICES=/dev/dri/card0:/dev/dri/card1 exec Hyprland
  exec Hyprland

  # NVIDIA as main GPU (nouveau driver):
  # WLR_DRM_DEVICES=/dev/dri/card1:/dev/dri/card0 exec Hyprland

  # Intel iGPU as main GPU:
  # exec Hyprland

fi
