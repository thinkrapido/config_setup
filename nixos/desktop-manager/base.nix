{ config, pkgs, ...}:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    desktopManager.xterm.enable = true;
    displayManager.defaultSession = "gnome";
  };
  hardware.opengl.enable = true;
}
