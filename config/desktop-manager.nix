{ config, pkgs, ...}:

{
    imports = [
        ../nixos/desktop-manager/base.nix
#        ../nixos/desktop-manager/touchpad.nix
        ../nixos/desktop-manager/timezone.nix
        ../nixos/desktop-manager/i18n.nix
        ../nixos/desktop-manager/fonts.nix
        ../nixos/desktop-manager/print.nix
        ../nixos/desktop-manager/bluetooth.nix
#        ../nixos/desktop-manager/hyprland.nix
        ../nixos/desktop-manager/gnome.nix
        ../nixos/desktop-manager/sound.nix
    ];
}
