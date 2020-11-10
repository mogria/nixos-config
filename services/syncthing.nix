{ pkgs, config, ... }:

{
  services.syncthing = {
    enable = true;
    configDir = "/var/lib/syncthing/.config/syncthing";
    dataDir = "/var/lib/syncthing";
    # package


    # all_proxy

    # declarative = {
    #  devices = {
    #    void = { addresses = [ "tcp://192.168.1.2" ]; introducer = true; };
    #  };

      # folders = {
      #   /srv/storagu
      # }
    # };
  };
}
