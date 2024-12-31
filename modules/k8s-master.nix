{
  config, pkgs, ... }:
{
  # Enable kube-apiserver, etcd, and controller-manager
  services.kubernetes = {
    enable = true;
    master = true;
    roles = [ "master" ];
  };

  # Optional: XFCE desktop environment
  services.xserver.enable = true;
  services.xserver.windowManager.xfce.enable = true;

  environment.systemPackages = with pkgs; [
    xfce4
  ];
}
