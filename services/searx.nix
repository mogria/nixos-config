{ config, pkgs, lib, ... }:

{

  networking.extraHosts = ''
    127.0.0.1 searx.local
    ::11 searx.local
  '';

  services.searx = {
    enable = true;
    configFile = ./searx-settings.yml;
  };

  # client is a fast socks port which only
  # creates circuits every 10 minutes,
  # especially suitable for HTTP
  services.tor = {
    enable = true;
    client = {
      enable = true;
      # these are the defaults, but make sure listen address is localhost
      socksListenAddress = "127.0.0.1:9050"; 
      socksListenAddressFaster = "127.0.0.1:9063"; #this is the faster port
    };
  };
}
