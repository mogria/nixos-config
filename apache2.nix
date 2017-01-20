{ config, pkgs, ... }:

{
  services.httpd = {
    enable = true;
    enablePHP = true;
    phpPackage = pkgs.php56;
    adminAddr = "root@localhost";
    documentRoot = "/var/www";
    virtualHosts = [
      {
        hostName = "esther-loeffel";
        documentRoot = "/var/www/esther-loeffel";
        extraConfig = ''
        DirectoryIndex index.php
	'';
      }
    ];
  };
}
