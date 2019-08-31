{ config, pkgs, lib, ... }:

{
  services.transmission = {
    enable = true;
    settings = {
      "watch-dir" = "/srv/storage/Transmission/To-Download";
      "watch-dir-enabled" = true;
      "download-dir" = "/srv/storage/Transmission/Completed-Downloads";
      "incomplete-dir" = "/srv/storage/Transmission/Incomplete-Downloads";
      "incomplete-dir-enabled" = true;
      "rpc-enabled" = true;
      "rpc-whitelist" = "127.0.0.1,192.168.*.*";
      "lpd-enabled" = true;
    };
  };
}
