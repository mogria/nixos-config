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

      /* web interface, accessible from local network */
      "rpc-enabled" = true;
      "rpc-bind-address" = "0.0.0.0";
      "rpc-whitelist" = "127.0.0.1,192.168.*.*";
      "rpc-host-whitelist" = "void,192.168.*.*";
      "rpc-host-whitelist-enabled" = true;

      "lpd-enabled" = true; /* local peer discovery */

      /* ip blocklist */
      "blocklist-enabled" = true;
      "blocklist-updates-enabled" = true;
      "blocklist-url" = "http://john.bitsurge.net/public/biglist.p2p.gz";
      /* taken from here: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/ */

      /* download speed settings */
      "speed-limit-down" = 1200;
      "speed-limit-down-enabled" = true;
      "speed-limit-up" = 120;
      "speed-limit-up-enabled" = true;
    };
  };

  networking.firewall.allowedTCPPorts = [ 9091 ];
}
