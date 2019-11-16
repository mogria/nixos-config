{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../hardware/wifi/dlink-dwa-172.nix
    ../../nix/distributed-builds.nix
    ../../graphical/framebuffer.nix
    ../../headless/ntp.nix
    ../../services/wifi-hotspot.nix
    ../../services/dhcpd-raspi.nix
    ../../services/wol-forward.nix
    # ../../services/openldap.nix
    ../../users/minimal.nix

  ];

  networking.hostName = "noroute";
  /* networking.wireless = {
    enable = true;
    interfaces = [ "wlan0" ];
    networks = {
      "CISCO 1457" = { psk = builtins.readFile /.wlan-psk; };
    };
    userControlled.enable = true;
  }; */
}
