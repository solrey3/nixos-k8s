{
  description = "Kubernetes cluster on NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations = {
      nixos-k8s-huey = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/base.nix
          ./hosts/nixos-k8s-huey/configuration.nix
          ./hosts/nixos-k8s-huey/hardware-configuration.nix
          ./modules/k8s-master.nix
        ];
      };

      nixos-k8s-dewey = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/base.nix
          ./hosts/nixos-k8s-dewey/configuration.nix
          ./hosts/nixos-k8s-dewey/hardware-configuration.nix
          ./modules/k8s-worker.nix
        ];
      };

      nixos-k8s-louie = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/base.nix
          ./hosts/nixos-k8s-louie/configuration.nix
          ./hosts/nixos-k8s-louie/hardware-configuration.nix
          ./modules/k8s-worker.nix
        ];
      };
    };
  };
}
