{
  description = "Base nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.shogun = nixpkgs.lib.nixosSystem {
      modules = [
        ./shogun.nix
        ./configuration.nix
        ./syncthing.nix
        ./shogun_syncthing.nix
        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lordskh = import ./home.nix;
          }
      ];
    };
  };
}
