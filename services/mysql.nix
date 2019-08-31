{ config, pkgs, ... }:

{
  services.mysql = {
    enable = true;
    bind = "127.0.0.1";
    package = pkgs.mariadb;
    dataDir = "/home/mysql/datadir";
  };
}
