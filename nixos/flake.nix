{
  description = "NixOS systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";

    streamfox.url = "github:aleksbgbg/streamfox";
    streamfox.inputs.nixpkgs.follows = "nixpkgs";

    streamfox-live.url = "gitlab:aleksbgbg/streamfox-live";
    streamfox-live.inputs.nixpkgs.follows = "nixpkgs";

    streamfox-live-staging.url = "gitlab:aleksbgbg/streamfox-live/staging";
    streamfox-live-staging.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = {
      aleksbgbg-d = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          ./systems/aleksbgbg-d/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.aleksbgbg = import ./systems/aleksbgbg-d/home.nix;
          }
        ];
      };

      streamfox-s = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          ./systems/streamfox-s/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.aleksbgbg = import ./systems/streamfox-s/home.nix;
          }
        ];
      };
    };
  };
}
