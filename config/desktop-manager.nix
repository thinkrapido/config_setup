{ config, pkgs, ...}:

{
    imports = [
        ../nixos/desktop-manager/base.nix
        ../nixos/desktop-manager/gnome.nix
        #../nixos/desktop-manager/hyprland.nix
    ];
}