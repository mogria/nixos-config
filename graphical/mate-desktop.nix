
{ config, pkgs, lib, ... }:

{
  imports = [
    ./packages.nix
    ./desktop.nix
    ./dm.nix
  ];

  environment.mate.excludePackages = [
    pkgs.mate.mate-terminal
  ];

  services.xserver.desktopManager.mate = {
    enable = true;
    # debug = true;
  };

  # this is required for mounting android phones
  # over mtp://
  services.gvfs.enable = true;

  # services.udev.packages = [ pkgs.gnome3.gnome_settings_daemon ];

  environment.systemPackages = [
    # scanning
    pkgs.gnome3.simple-scan

  ];

  services.dbus.packages = [
    # this is required or else a warning appears on XFCE startup
    # that no service for blueman has been found,...
    (lib.mkIf config.hardware.bluetooth.enable pkgs.gnome3.gnome-bluetooth)
  ];

  # Enable the GNOME Desktop Environment.
  # services.xserver.desktopManager.gnome3 = {
  #   enable = true;
  # };

  # environment.gnome3.excludePackages = [
  #   pkgs.gnome3.evolution
  #   pkgs.gnome3.gnome-software
  #   pkgs.gnome3.vinagre
  #   pkgs.gnome3.gnome-maps
  #   pkgs.gnome3.epiphany
  # ];
}
