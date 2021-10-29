{ config, pkgs, lib, ... }:

{
  networking.extraHosts = ''
    127.0.0.1 esther-loeffel.dev.local
    127.0.0.1 baukombinat.dev.local
    127.0.0.1 gartenforst.dev.local
    # 127.0.0.1 esther-loeffel-before-upgrade.dev.local
    ::1  esther-loeffel.dev.local
    ::1  baukombinat.dev.local
    #::1  esther-loeffel-before-upgrade.dev.local
  '';

  services.httpd = {
    enable = true;
    enablePHP = true;
    phpOptions = ''
        post_max_size = 20M
        upload_max_filesize = 20M
    '';
    phpPackage = pkgs.php73; # php 5.6 is not available anymore in nixpkgs
    adminAddr = "root@localhost";
    # documentRoot = "/var/www";
    # listen = [ { ip = "127.0.0.1"; port = 80; } ];
    virtualHosts = {
      "esther-loeffel.dev.local" = {
        listen = [ { ip = "127.0.0.1"; port = 80; } ];
        documentRoot = "/var/www/esther-loeffel";
        extraConfig = ''
          DirectoryIndex index.php
        '';
      };
     "gartenforst.dev.local" = {
        listen = [ { ip = "127.0.0.1"; port = 80; } ];
        documentRoot = "/var/www/gartenforst";
        extraConfig = ''
          DirectoryIndex index.php
        '';
      };
      # {
        # listen = [ { ip = "127.0.0.1"; port = 80; } ];
        # hostName = "esther-loeffel-before-upgrade.dev.local";
        # documentRoot = "/var/www/esther-loeffel-before-upgrade";
        # extraConfig = ''
          # DirectoryIndex index.php
        # '';
      # }
     "baukombinat.dev.local" = {
        listen = [ { ip = "127.0.0.1"; port = 80; } ];
        documentRoot = "/var/www/baukombinat";
        extraConfig = ''
          DirectoryIndex index.php
        '';
      };
    };

    extraConfig = ''
      <Directory /var/www>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
      </Directory>
    '';

  };
}
