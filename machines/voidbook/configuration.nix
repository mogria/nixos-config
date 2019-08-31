# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../graphical/xfce-desktop.nix
      # ./../../services/mysql.nix
      ./../../services/postgres.nix
      # ./../../services/venus.nix
      # ./../../services/i2p.nix
      ./../../services/bluetooth.nix
      ./../../laptop/laptop-power.nix
      # ./../../dhcpd-raspi.nix
      # ./../../ilias-mount.nix
      # ./../../guezzlpage
      # ./../../listenin.nix
      # ./../../34c3-cert.nix
      # ./../../wireguard.nix
      # ./../../services/searx/default.nix
      # ./../../mongo.nix
    ];


  networking.hostId = "A77B2F82"; # ZFS Needs this
  networking.hostName = "voidbook"; # Define your hostname.

  system.stateVersion = "18.03";

}
