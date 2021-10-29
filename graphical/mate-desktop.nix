
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

}
