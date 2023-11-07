{ config, pkgs, ...}:

{
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
    ];
  };
}
