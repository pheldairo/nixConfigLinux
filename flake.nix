{
  description = "T14s";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms.url = "github:AvengeMedia/DankMaterialShell";
  };

  outputs = inputs@{
    nixpkgs,
    home-manager,
    dms,
    nixvim,
    ...
  }: {
    nixosConfigurations.nix =
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./hosts/t14s/configuration.nix

          home-manager.nixosModules.home-manager {
  	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
  	    home-manager.users.delphy = import ./home/delphy.nix;
	    home-manager.extraSpecialArgs = {
               inherit nixvim;
            };
	  }
        ];
      };
  };
}
