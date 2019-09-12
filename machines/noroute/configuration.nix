{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../graphical/framebuffer.nix
    ../../services/wifi-hotspot.nix
    ../../services/dhcpd-raspi.nix
    ../../services/wol-forward.nix
    ../../users/minimal.nix
  ];

  networking.hostName = "noroute";
  networking.wireless = {
    enable = true;
    interfaces = [ "wlan0" ];
    networks = {
      "CISCO 1457" = { psk = builtins.readFile /.wlan-psk; };
    };
    userControlled.enable = true;
  };

  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 30d";
}
