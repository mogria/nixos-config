{ config, pkgs, lib, ... }: 

{
  networking.nat = {
    internalInterfaces = [
      "ve-guezzltor"
    ];
  };

  containers.guezzltor = {
    privateNetwork = true;
    hostAddress = "192.168.202.1";
    localAddress = "192.168.202.2";


    config = {

      networking.defaultGateway = "192.168.202.1";

      services.tor = {
        enable = true;
        extraConfig = ''
          HiddenServiceDir /var/lib/tor/guezzltor
          HiddenServicePort 80 192.168.201.2:80
        '';
      };
    };
  };
}
