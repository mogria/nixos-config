{ config, pkgs, ... }:

let
  postgresPackage = pkgs.postgresql_13;
in {
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    package = postgresPackage;

    # authentication = ''
    # '';
    #
    # settings = {
    # };

    extraPlugins = with postgresPackage.pkgs; [ tsearch_extras pg_similarity ];
  };
}
