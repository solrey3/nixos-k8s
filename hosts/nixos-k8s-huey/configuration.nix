{ config, pkgs, ... }:

{
  networking.hostName = "nixos-k8s-huey";

  # Kubernetes-specific configuration
  services.kubernetes.clusterToken = "your-cluster-token"; # Replace with your cluster token
}
