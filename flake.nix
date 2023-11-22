{
  description = "A very basic flake";

  inputs = rec {

    nixpkgs.url = github:NixOs/nixpkgs/nixos-23.05;
    home-manager.url = github:nix-community/home-manager/release-23.05;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nixpkgs, home-manager, ... }: 
  
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    username = "$USER";
  in {
    nixosConfigurations.desktop = lib.nixosSystem {
      inherit system;
      modules = [
        ./nixos/configuration.nix
      ];
    };
    homeConfigurations.jbc = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        ./dotconfigs/all/home-manager/home.nix
      ];
    };
  };
}
