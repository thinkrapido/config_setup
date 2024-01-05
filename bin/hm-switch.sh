cd ~/.config/Mothership/config/
NIXPKGS_ALLOW_INSECURE=1 home-manager switch --flake . --impure
dotconfig.fish ${1:-base}
