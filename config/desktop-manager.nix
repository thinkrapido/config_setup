{ config, pkgs, ...}:

let 

    readDir = dir: map (x: "${dir}/${x}") (builtins.attrNames (builtins.readDir dir));

in {
    imports = readDir ../nixos/desktop-manager;
}
