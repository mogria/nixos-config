{ pkgs, config, ... }:

{
  services.syncthing = {
    enable = true;
    configDir = "/home/syncthing/.config/syncthing";
    dataDir = "/home/syncthing/data";

    # package


    # all_proxy

    declarative = {
      devices = {
        void = { id = "void"; addresses = [ "tcp://192.168.1.2" "tcp://void.home" ]; introducer = true; };
        voidbook = { id = "X7M3IX6-J47VWTQ-AAH5CTQ-SSZYVUE-RZJPNF7-JDJZ4PX-QMKPCXC-HX23LQC"; addresses = [ "tcp://voidbook.home" ]; introducer = true; };
      };

      folders = {
        "/home/syncthing/data/share" = {
           id = "share";
	};
      };

      # overrideFolders = false;
      # overrideDevices = false;
    };
  };
}