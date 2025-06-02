{
  description = "NixOS systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations.aleksbgbg-d = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./systems/aleksbgbg-d/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.aleksbgbg = import ./home.nix;
        }
      ];
    };
  };
}
