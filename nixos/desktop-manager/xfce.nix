{ config, pkgs, ...}:

{
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.displayManager.xfce.enable = true
}
