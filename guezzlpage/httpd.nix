{ config, pkgs, ... }:

{
  containers.guezzlweb = {
    privateNetwork = true;
    hostAddress = "192.168.201.1";
    localAddress = "192.168.201.2";

    bindMounts = {
      "/srv/web/guezzlpage" = {
        hostPath = "/srv/web/guezzlpage";
        isReadOnly = true;
      };
    };

    config = {
      networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 80 ];
      };

      fileSystems.guezzlcache = {
        mountPoint = "/srv/web/guezzlpage-compression-cache";
        fsType = "tmpfs";
      };

      systemd.services.lighttpd.preStart =  ''
        mkdir -p /srv/web/guezzlpage-compression-cache/mod_compress
        # the webserver can only generate the compressed files
        # when ownership and group is set correctly
        chown lighttpd:lighttpd /srv/web/guezzlpage-compression-cache/mod_compress
      '';

      services.lighttpd = {
        enable = true;
        document-root = "/srv/web/guezzlpage";
        enableModules = [ "mod_access" "mod_compress" "mod_setenv" "mod_expire" ];
        extraConfig = ''
        server.follow-symlink = "disable"
        server.range-requests = "disable"
        server.tag = "guzSelSoerrrveRrrr 93113516.572.312-beta15=Q3-123123/HTTP5531 koooooollleeeeggggg"
        url.access-allow = ( ".png", ".css", ".js", ".html", "/" )

        compress.cache-dir = "/srv/web/guezzlpage-compression-cache/mod_compress"
        compress.allowed-encodings = ( "bzip2", "gzip", "deflate" )
        compress.filetype = ( "text/html", "text/css", "application/javascript", "text/javascript" )
        setenv.add-response-header = ( "Content-Security-Policy" => "default-src 'none'; script-src 'self'; style-src 'self' 'unsafe-inline'; img-src 'self'; font-src fonts.googleapis.com; block-all-mixed-content; reflected-xss block;",
                                       "X-XSS-Protection" => "1; mode=block",
                                       "X-Content-Type" => "nosniff",
                                       "X-Frame-Options" => "SAMEORIGIN",
                                       "X-STRAIGHT-EDGE-AF-X" => "true",
                                       "X-Hallo-Timo-was-laeuft" => "wenn du das so seisch denn wird das wohl so sii" )


        expire.url = ( "/img" => "access plus 1 hours",
                       "/js"  => "access plus 1 hours",
                       "/css"  => "access plus 1 hours")
        '';
      };
    };
  };
}
