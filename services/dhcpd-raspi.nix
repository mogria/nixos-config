{ config, pkgs, ... }:
{
  services.dhcpd4 = {
    enable = true;
    interfaces = [ "enp4s0f1" ];
    extraConfig = ''
      option subnet-mask 255.0.0.0;
      option broadcast-address 10.255.255.255;
      option routers 10.1.1.35;
      option domain-name-servers 8.8.8.8, 8.8.4.4;
      option domain-name "mshome.net";
      subnet 10.1.1.0 netmask 255.255.255.0 {
        range 10.1.1.2 10.1.1.19;
      }
    '';
    machines = [
      {
        ethernetAddress = "a8:1e:84:d6:39:e7";
        hostName = "raspberrypi.mshome.net";
        ipAddress = "10.1.1.20";
      }
      {
        ethernetAddress = "e0:3f:49:7f:b0:ab";
        hostName = "void";
        ipAddress = "10.1.1.23";
      }
    ];
  };

  networking.interfaces.enp4s0f1.ipv4.addresses = [ { address = "10.1.1.35"; prefixLength = 24; } ];
  networking.dhcpcd.denyInterfaces = [ "wlp3s0" ];
  networking.networkmanager.unmanaged = [ "enp4s0f1" ];

  networking.nat = {
    enable = true;
    externalInterface = "wlp3s0";
    internalInterfaces = [ "enp4s0f1" ];
  };
}
