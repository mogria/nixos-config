{ config, pkgs, lib, ... }:
{
  imports = [
    ./desktop.nix
  ];

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  environment.systemPackages = with pkgs.kdeApplications; [
    knotes
    korganizer
    kcalutils
    kcalcore
    kalarm
    kalarmcal
    ark
    pkgs.skanlite
  ];

}
