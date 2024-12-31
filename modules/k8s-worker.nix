{
  config, pkgs, ... }:
{
  # Enable Kubernetes worker services
  services.kubernetes = {
    enable = true;
    roles = [ "node" ];
    masterAddress = "nixos-k8s-huey"; # Replace with the actual IP or hostname of the master
  };
}
