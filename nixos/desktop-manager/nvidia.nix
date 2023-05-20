{ config, pkgs, ...}:

{
  hardware.nvidia.modesetting.enable = true;
  services.xserver.videoDriver = [ "nvidia" ];
}