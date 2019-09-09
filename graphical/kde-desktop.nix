{ config, pkgs, lib, ... }:
{
  imports = [
    ./desktop.nix
  ];

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

}
