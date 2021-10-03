{ config, pkgs, ... }:

let
  postgresPackage = pkgs.postgresql_12;
in {

  networking.firewall.allowedTCPPorts = [ 5432 ];
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    package = postgresPackage;

    authentication = ''
      # TYPE    DATABASE    USER        ADDRESS         METHOD  OPTIONS
      local     all         postgres                    peer
      local     all         dev                         md5
      host      all         dev         samenet         md5
    '';

    ensureUsers = [
      {
        name = "dev";
        ensurePermissions = {
          "ALL TABLES IN SCHEMA public" = "ALL PRIVILEGES";
        };
      }
    ];

    settings = {
      statement_timeout = 0; # disable statement timeout
    };

    extraPlugins = with postgresPackage.pkgs; [ tsearch_extras pg_similarity ];
  };
}
