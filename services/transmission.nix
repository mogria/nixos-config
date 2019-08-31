{ config, pkgs, lib, ... }:

{
  services.transmission = {
    enable = true;
    settings = {
      /* directory settings */
      "watch-dir" = "/srv/storage/Transmission/To-Download";
      "watch-dir-enabled" = true;
      "download-dir" = "/srv/storage/Transmission/Completed-Downloads";
      "incomplete-dir" = "/srv/storage/Transmission/Incomplete-Downloads";
      "incomplete-dir-enabled" = true;

      "rpc-enabled" = true;
      "rpc-bind-address" = "0.0.0.0";
      "rpc-whitelist" = "127.0.0.1,192.168.*.*";
      "rpc-host-whitelist" = "void,192.168.*.*";
      "rpc-host-whitelist-enabled" = true;
      "lpd-enabled" = true;
    };
  };

  networking.firewall.allowedTCPPorts = [ 9091 ];
}
