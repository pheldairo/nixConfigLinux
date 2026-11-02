{
  description = "T14s";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lsfg-vk = {
      url = "github:Daaboulex/lsfg-vk-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./hosts/t14s/configuration.nix

          {
            nixpkgs.overlays = [
              inputs.lsfg-vk.overlays.default
            ];
          }

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.delphy = import ./home/delphy.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
          }
        ];
      };

      devShells.${system} = rec {
        golang = import ./dev/golang.nix { inherit pkgs; };
        rust-learning = import ./dev/rust-learning.nix { inherit pkgs; };
        cpp = import ./dev/cpp.nix { inherit pkgs; };
        python = import ./dev/python.nix { inherit pkgs; };
        default = golang;
      };
    };
}
