{ config, pkgs, lib, ... }:
let
  externalInterface = "wlp2s0u2"; # wlp3s0
  internalInterfaces = [ "enp3s0" ]; # enp4s0f1
in {
  services.dhcpd4 = {
    enable = true;
    interfaces = internalInterfaces;
    extraConfig = ''
      option subnet-mask 255.0.0.0;
      option broadcast-address 10.255.255.255;
      option routers 10.1.1.35;
      option domain-name-servers 8.8.8.8, 8.8.4.4;
      option domain-name "nonet.test";
      subnet 10.1.1.0 netmask 255.255.255.0 {
        range 10.1.1.2 10.1.1.19;
      }
    '';
    machines = [
      {
        ethernetAddress = "a8:1e:84:d6:39:e7";
        hostName = "voidpi.nonet.test";
        ipAddress = "10.1.1.20";
      }
      /* {
        ethernetAddress = "e0:3f:49:7f:b0:ab";
        hostName = "void";
        ipAddress = "10.1.1.23";
      } */
    ];
  };

  networking.interfaces = lib.genAttrs internalInterfaces (interface: {
    ipv4.addresses = [ { address = "10.1.1.35"; prefixLength = 8; } ];
  });
  networking.dhcpcd.denyInterfaces = [ externalInterface ];
  networking.networkmanager.unmanaged = internalInterfaces;

  networking.nat = {
    enable = true;
    inherit externalInterface;
    inherit internalInterfaces;
  };
}
