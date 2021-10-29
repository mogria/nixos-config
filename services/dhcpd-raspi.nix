{ config, pkgs, lib, ... }:

let
  externalInterface = "enp4s0r1"; # "wlp3s0"; # "eth0"; # wlp3s0
  internalInterfaces = [ "wlp3s0" ]; # [ "wlan0" ]; # enp4s0f1
  # note: setting up the same net for multiple internal
  # interfaces doesn't work (yet),
  # only the first one gets initialized
  netNo = "23";
  domain = "mynet.test";
in {
  networking.hosts = {
    # "192.168.${netNo}.1" = [ "raspi4" "raspi4.mynet.test" ];
  };

  services.dnsmasq = {
    enable = true;
    alwaysKeepRunning = true;
    servers = [ "1.1.1.1" "8.8.4.4" ];
    extraConfig = ''
      ${builtins.concatStringsSep "\n" (map (interface: "interface=${interface}") internalInterfaces)}

      domain=mynet.test
    '';
  };
  services.dhcpd4 = {
    enable = true;
    interfaces = internalInterfaces;
    extraConfig = ''
      option subnet-mask 255.255.255.0;
      option broadcast-address 192.168.${netNo}.255;
      option routers 192.168.${netNo}.1;
      option domain-name-servers 192.168.${netNo}.1, 1.1.1.1;
      option domain-name "mynet.test";
      subnet 192.168.${netNo}.0 netmask 255.255.255.0 {
        range 192.168.${netNo}.20 192.168.${netNo}.99;
      }
    '';
    machines = [
     {
       ethernetAddress = "dc:a6:32:21:2e:69";
       hostName = "raspi4";
       ipAddress = "192.168.${netNo}.2";
     }
    ];
  };

  networking.interfaces = lib.genAttrs internalInterfaces (interface: {
    ipv4.addresses = [ { address = "192.168.${netNo}.1"; prefixLength = 24; } ];
  });
  # networking.dhcpcd.allowInterfaces = [ externalInterface ];
  networking.dhcpcd.denyInterfaces = internalInterfaces;
  networking.networkmanager.unmanaged = internalInterfaces;

  networking.nat = {
    enable = true;
    inherit externalInterface;
    inherit internalInterfaces;
    internalIPs = [ "192.168.${netNo}.0/24" ];
  };
}
