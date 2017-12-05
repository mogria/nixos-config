{
  services.dhcpd4 = {
    enable = true;
    interfaces = [ "enp0s20u2" ];
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
        ethernetAddress = "b8:27:eb:c8:43:b8";
        hostName = "raspberrypi.mshome.net";
        ipAddress = "10.1.1.20";
      }
    ];
  };

  networking.interfaces.enp0s20u2.ip4 = [ { address = "10.1.1.35"; prefixLength = 24; } ];
  networking.dhcpcd.denyInterfaces = [ "enp0s20u2" ];
  networking.networkmanager.unmanaged = [ "enp0s20u2" ];

  networking.nat = {
    enable = true;
    externalInterface = "wlp2s0";
    internalInterfaces = [ "enp0s20u2" ];
  };
}
