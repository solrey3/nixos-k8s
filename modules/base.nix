{
  config, pkgs, ... }:
{
  imports = [
    "${pkgs.path}/nixos/modules/virtualization/containerd.nix"
  ];

  # Common configuration for all nodes
  networking = {
    hostName = config.networking.hostName;
    useDHCP = false;
    interfaces.enp1s0.useDHCP = true; # Adjust for your network interface
  };

  time.timeZone = "America/New_York";

  # Enable SSH for remote management
  services.openssh.enable = true;

  # Install common packages
  environment.systemPackages = with pkgs; [
    vim
    tmux
    htop
    git
    kubectl
    containerd
  ];

  # Configure container runtime
  virtualisation.containerd.enable = true;

  # Firewall settings
  networking.firewall.enable = false; # Disable for simplicity, enable if needed
}
