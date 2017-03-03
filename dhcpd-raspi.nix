{
  services.dhcpd = {
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
        ethernetAddress = "b8:27:eb:24:c1:ca";
        hostName = "raspberrypi.mshome.net";
        ipAddress = "10.1.1.20";
      }
    ];
  };

  networking.nat = {
    enable = true;
    externalInterface = "wlp2s0";
    internalInterfaces = [ "enp0s20u2" ];
  };
}
