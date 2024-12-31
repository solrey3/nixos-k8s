{ config, lib, pkgs, ... }:

{
  # Hardware-specific configurations for nixos-k8s-louie
  boot.loader.systemd-boot.enable = true;
  fileSystems."/".device = "/dev/disk/by-uuid/YOUR-ROOT-UUID"; # Replace with your root partition UUID
  fileSystems."/boot".device = "/dev/disk/by-uuid/YOUR-BOOT-UUID"; # Replace with your boot partition UUID
  swapDevices = [
    { device = "/dev/disk/by-uuid/YOUR-SWAP-UUID"; }
  ];
}
