{ config, pkgs, lib, ... }:

{
  networking.extraHosts = ''
    127.0.0.1 esther-loeffel.dev.local
    127.0.0.1 baukombinat.dev.local
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
    # phpPackage = pkgs.php56; php 5.6 is not available anymore in nixpkgs
    adminAddr = "root@localhost";
    documentRoot = "/var/www";
    listen = [ { ip = "127.0.0.1"; port = 80; } ];
    virtualHosts = [
      {
        listen = [ { ip = "127.0.0.1"; port = 80; } ];
        hostName = "esther-loeffel.dev.local";
        documentRoot = "/var/www/esther-loeffel";
        extraConfig = ''
          DirectoryIndex index.php
        '';
      }
      # {
        # listen = [ { ip = "127.0.0.1"; port = 80; } ];
        # hostName = "esther-loeffel-before-upgrade.dev.local";
        # documentRoot = "/var/www/esther-loeffel-before-upgrade";
        # extraConfig = ''
          # DirectoryIndex index.php
        # '';
      # }
      {
        listen = [ { ip = "127.0.0.1"; port = 80; } ];
        hostName = "baukombinat.dev.local";
        documentRoot = "/var/www/baukombinat";
        extraConfig = ''
          DirectoryIndex index.php
        '';
      }
    ];

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
