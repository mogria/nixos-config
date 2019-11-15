
{

  networking.extraHosts = ''
    127.0.0.1 news.nonet.test
    ::1 news.nonet.test
  '';

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;

    virtualHosts = {
      "news.nonet.test" = {
        listen = [
          { addr = "127.0.0.1"; port = 80; }
        ];
        root = "/var/www/news.nonet";

        locations  = {
          "/" = {
            index = "index.html";
          };
        };
      };
    };
  };

}
